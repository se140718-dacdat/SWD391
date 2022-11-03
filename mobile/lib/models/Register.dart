// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    this.userName,
    this.password,
    this.fullName,
    this.description,
    this.phone,
    this.gender,
    this.avatarUrl,
    this.buildingId,
  });

  String? userName;
  String? password;
  String? fullName;
  String? description;
  String? phone;
  String? gender;
  String? avatarUrl;
  String? buildingId;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        userName: json["userName"],
        password: json["password"],
        fullName: json["fullName"],
        description: json["description"],
        phone: json["phone"],
        gender: json["gender"],
        avatarUrl: json["avatarUrl"],
        buildingId: json["buildingId"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
        "fullName": fullName,
        "description": description,
        "phone": phone,
        "gender": gender,
        "avatarUrl": avatarUrl,
        "buildingId": buildingId,
      };
}
