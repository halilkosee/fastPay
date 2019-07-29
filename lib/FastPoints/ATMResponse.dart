class ATMResponse{
  List<ATMBilgileri> points;

  ATMResponse({this.points,});

  factory ATMResponse.fromJson(Map<String, dynamic> map) {
    return ATMResponse(
      points: map['points'],

    );
  }
}

class ATMBilgileri{

  String name;
  String cityName;
  String address;
  double latitude;
  double longitude;


  ATMBilgileri({this.name, this.cityName, this.address,
    this.latitude, this.longitude});

  factory ATMBilgileri.fromJson(Map<String, dynamic> map) {
    return ATMBilgileri(
      name: map['name'],
      cityName: map['cityName'],
      address: map['address'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }


}