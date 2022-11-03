// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final building = buildingFromJson(jsonString);

import 'dart:convert';

Building buildingFromJson(String str) => Building.fromJson(json.decode(str));

String buildingToJson(Building data) => json.encode(data.toJson());

class Building {
  String? id;
  String? name;
  String? address;
  Building({
    this.id,
    this.name,
    this.address,
  });

  Building copyWith({
    String? id,
    String? name,
    String? address,
  }) {
    return Building(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
    };
  }

  factory Building.fromMap(Map<String, dynamic> map) {
    return Building(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Building.fromJson(String source) =>
      Building.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Building(id: $id, name: $name, address: $address)';

  @override
  bool operator ==(covariant Building other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.address == address;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ address.hashCode;
}
