class Address {
  double latitude;
  double longitude;

  Address({this.latitude, this.longitude});

  @override
  String toString() {
    return 'Address{latitude: $latitude, longitude: $longitude}';
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        latitude: double.parse(json['latitude']),
        longitude: double.parse(json['longitude']));
  }
}
