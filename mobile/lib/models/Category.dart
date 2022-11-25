// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

Categori categoryFromJson(String str) => Categori.fromJson(json.decode(str));

String categoryToJson(Categori data) => json.encode(data.toJson());

class Categori {
  String? id;
  String? name;
  String? icon;
  Categori({
    this.id,
    this.name,
    this.icon,
  });

  Categori copyWith({
    String? id,
    String? name,
    String? icon,
  }) {
    return Categori(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'icon': icon,
    };
  }

  factory Categori.fromMap(Map<String, dynamic> map) {
    return Categori(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Categori.fromJson(String source) =>
      Categori.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Categori(id: $id, name: $name, icon: $icon)';

  @override
  bool operator ==(covariant Categori other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.icon == icon;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ icon.hashCode;
}
