import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    required this.userName,
    required this.password,
    required this.phone,
  });

  String userName;
  String password;
  String phone;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        userName: json["userName"],
        password: json["password"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
        "phone": phone,
      };
}
