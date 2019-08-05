import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:fastpay/FastPoints/ATMResponse.dart';
import 'package:fastpay/FastPoints/StartAppResponse.dart';

class ItemService {
  final String _serviceUrl = '**************************************';

  static String sessionId = " ";

  static String checksum = " ";

  Future<StartAppResponse> authentication() async {
    var uri = Uri.https(_serviceUrl, "*******************************");
    var payload = {
      "device": {
        "make": "HUAWEI",
        "model": "HUAWEI CLT-L09",
        "os": {"family": "Android", "version": "9"},
        "deviceCode": "************************",
        "hasNfc": false
      },
      "appVersion": "8.0.0",
      "localeVersion": "string",
      "appName": "fastPay"
    };

    var jsonString = json.encode(payload);

    final response = await http.post(uri,
        headers: {
          'Accept': 'application/json; charset=UTF-8',
          'Content-Type': ' **********************',
          'Referer': 'Splash',
          'X-Client-Id': '*******************',
          'Accept-Language': 'TR',
          'X-Is-Voice-Over-Enabled': 'false',
        },
        body: jsonString);

    if (response.statusCode == 200) {
      sessionId = response.headers['x-token'];
      checksum = response.headers['x-checksum'];

      Map item = json.decode(response.body);
      return StartAppResponse.fromJson(item);
    } else {
      throw Exception("Something went wrong");
    }
  }

  Set<Marker> markerList;

  Future<Set<Marker>> AtmlereEris(BuildContext context) async {
    if (markerList != null) return markerList;
    await authentication();
    var parameters = {
      "type": "ATM",
      "latitude": "40.92221265541326",
      "longitude": "29.33946132659912"
    };

    var uri = Uri.https(_serviceUrl, "*******************", parameters);

    final response = await http.get(
      uri,
      headers: {
        'Accept': '*********************',
        'Content-Type': 'application/json',
        '*********************',
        'X-Client-Id': *********************,
        'Accept-Language': 'TR',
        'X-Is-Voice-Over-Enabled': 'false',
        'X-Token': sessionId,
        'X-CheckSum': checksum,
      },
    );

    if (response.statusCode == 200) {
      markerList = new Set();
      final jsonData = json.decode(response.body);
      final list = jsonData['points'];

      Set<ATMBilgileri> lisst =
          Set<ATMBilgileri>.from(list.map((i) => ATMBilgileri.fromJson(i)));

      Position position = await _getLocation();

      markerList.add(Marker(
        infoWindow: InfoWindow(title: "You are here!"),
        icon: BitmapDescriptor.defaultMarker,
        markerId: MarkerId('yourlocation'),
        position: LatLng(position.latitude, position.longitude),
      ));

      markerList.addAll(lisst.map((ATMBilgileri atmBilgileri) {
        return new Marker(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (builder) {
                    return Container(
                        height: 90,
                        child: Row(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(children: <Widget>[
                              new Image.asset(
                                "assets/icons/fastNoktaPin.png",
                                width: 40,
                              ),
                            ]),
                          ),
                          Column(children: <Widget>[
                            Row(children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 10, top: 20),
                                  child: Text(
                                    "${atmBilgileri.name}",
                                    style: new TextStyle(fontSize: 18),
                                  )),
                            ]),
                            Container(
                                child: Expanded(
                                    child: Text("${atmBilgileri.address}")))
                          ])
                        ]));
                  });
            },

            //  visible: false,                                                                 //changed

            icon: BitmapDescriptor.defaultMarkerWithHue(190),
            infoWindow: InfoWindow(title: atmBilgileri.name),
            position: LatLng(atmBilgileri.latitude, atmBilgileri.longitude),
            markerId: MarkerId(atmBilgileri.name));
      }).toSet());

      return markerList;
    } else {
      throw Exception("Something went wrong");
    }
  }
}

Future<Position> _getLocation() async {
  var currentLocation;
  try {
    Geolocator geolocator = Geolocator();
    currentLocation = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  } catch (e) {
    currentLocation = null;
  }
  return currentLocation;
}
