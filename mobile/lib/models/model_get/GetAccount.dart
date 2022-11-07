// To parse this JSON data, do
//
//     final getAccount = getAccountFromJson(jsonString);

import 'dart:convert';

GetAccount getAccountFromJson(String str) =>
    GetAccount.fromJson(json.decode(str));

String getAccountToJson(GetAccount data) => json.encode(data.toJson());

class GetAccount {
  GetAccount({
    this.id,
    this.userName,
    this.fullName,
    this.description,
    this.phone,
    this.gender,
    this.avatarUrl,
    this.buildingId,
    this.wallet,
  });

  String? id;
  String? userName;
  String? fullName;
  String? description;
  String? phone;
  String? gender;
  String? avatarUrl;
  String? buildingId;
  Wallet? wallet;

  factory GetAccount.fromJson(Map<String, dynamic> json) => GetAccount(
        id: json["id"],
        userName: json["userName"],
        fullName: json["fullName"],
        description: json["description"],
        phone: json["phone"],
        gender: json["gender"],
        avatarUrl: json["avatarUrl"],
        buildingId: json["buildingId"],
        wallet: Wallet.fromJson(json["wallet"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "fullName": fullName,
        "description": description,
        "phone": phone,
        "gender": gender,
        "avatarUrl": avatarUrl,
        "buildingId": buildingId,
        "wallet": wallet!.toJson(),
      };
  @override
  String toString() {
    return 'GetAccount(id: $id, userName: $userName, fullName: $fullName, description: $description, phone: $phone, gender: $gender, avatarUrl: $avatarUrl, buildingId: $buildingId, wallet: $wallet)';
  }
}

class Wallet {
  Wallet({
    this.id,
    this.balance,
  });

  String? id;
  double? balance;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json["id"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "balance": balance,
      };
  @override
  String toString() => 'Wallet(id: $id, balance: $balance)';
}
