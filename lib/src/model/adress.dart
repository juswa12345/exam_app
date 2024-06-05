class Address {
  int id;
  String street;
  String streetName;
  String buildingNumber;
  String city;
  String zipcode;
  String country;
  String countyCode;
  double latitude;
  double longitude;

  Address({
    required this.id,
    required this.street,
    required this.streetName,
    required this.buildingNumber,
    required this.city,
    required this.zipcode,
    required this.country,
    required this.countyCode,
    required this.latitude,
    required this.longitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        street: json["street"],
        streetName: json["streetName"],
        buildingNumber: json["buildingNumber"],
        city: json["city"],
        zipcode: json["zipcode"],
        country: json["country"],
        countyCode: json["county_code"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "street": street,
        "streetName": streetName,
        "buildingNumber": buildingNumber,
        "city": city,
        "zipcode": zipcode,
        "country": country,
        "county_code": countyCode,
        "latitude": latitude,
        "longitude": longitude,
      };
}
