import 'package:exam_app/src/model/adress.dart';
import 'dart:convert';

List<Person> personFromJson(String str) =>
    List<Person>.from(json.decode(str).map((x) => Person.fromJson(x)));

String personToJson(List<Person> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Person {
  int id;
  String firstname;
  String lastname;
  String email;
  String phone;
  DateTime birthday;
  String gender;
  Address address;
  String website;
  String image;

  Person({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.birthday,
    required this.gender,
    required this.address,
    required this.website,
    required this.image,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        birthday: DateTime.parse(json["birthday"]),
        gender: json["gender"],
        address: Address.fromJson(json["address"]),
        website: json["website"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "birthday":
            "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "address": address.toJson(),
        "website": website,
        "image": image,
      };
}
