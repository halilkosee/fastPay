import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:location/location.dart';
import 'package:fastpay/FastPoints/Item_Service.dart';


class FastPoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ItemService _itemService;
  Position userLocation;
  GoogleMapController _controller;
  Location location=Location();

  Future<Set<Marker>> loadAtmFuture;
  GoogleMap map;
  Marker marker;

  @override
  void initState() {
    _itemService = ItemService();
    super.initState();

    loadAtmFuture = _itemService.AtmlereEris(context);
    loadAtmFuture.then((Set<Marker> markers) {
      marker = markers.first;


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Center(
          child: new Text(
            "EN YAKIN ATMLER",
          ),
        ),
      ),
      body: Stack(children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          child: FutureBuilder(
              future: loadAtmFuture,
              builder:
                  (BuildContext context, AsyncSnapshot<Set<Marker>> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(marker.position.latitude,
                              marker.position.longitude),
                          zoom: 0.0),
                      markers: snapshot.data,
                      onMapCreated: mapCreated,
                      mapType: MapType.normal,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                return new Container(
                  width: 0,
                  height: 0,
                );
              }),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10, top: 10),
          child: Align(
            alignment: Alignment.topRight,
            child: FloatingActionButton(
              onPressed: _zoomButton,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              backgroundColor: Colors.blue[290],
              child: const Icon(Icons.my_location, size: 33.0),
            ),
          ),
        )
      ]),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;

      if (marker != null)
        _controller.animateCamera(
            CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(marker.position.latitude, marker.position.longitude),zoom: 15)));

    });
  }

  void _zoomButton() {
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(new CameraPosition(
          target: LatLng(marker.position.latitude, marker.position.longitude),
          zoom: 25.0)),
    );
  }
}
