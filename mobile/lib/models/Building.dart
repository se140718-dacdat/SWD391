// To parse this JSON data, do
//
//     final building = buildingFromJson(jsonString);

import 'dart:convert';

Building buildingFromJson(String str) => Building.fromJson(json.decode(str));

String buildingToJson(Building data) => json.encode(data.toJson());

class Building {
  Building({
    this.id,
    this.name,
    this.address,
  });

  String? id;
  String? name;
  String? address;

  factory Building.fromJson(Map<String, dynamic> json) => Building(
        id: json["id"],
        name: json["name"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
      };
  @override
  String toString() => 'Building(id: $id, name: $name, address: $address)';
}
