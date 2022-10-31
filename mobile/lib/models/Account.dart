// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Account {
  String? id;
  String? phone;
  String? description;
  String? gender;
  String? fullName;
  String? avatarUrl;
  String? role;
  bool? status;
  String? jwtToken;
  Account({
    this.id,
    this.phone,
    this.description,
    this.gender,
    this.fullName,
    this.avatarUrl,
    this.role,
    this.status,
    this.jwtToken,
  });

  Account copyWith({
    String? id,
    String? phone,
    String? description,
    String? gender,
    String? fullName,
    String? avatarUrl,
    String? role,
    bool? status,
    String? jwtToken,
  }) {
    return Account(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      description: description ?? this.description,
      gender: gender ?? this.gender,
      fullName: fullName ?? this.fullName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      role: role ?? this.role,
      status: status ?? this.status,
      jwtToken: jwtToken ?? this.jwtToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'phone': phone,
      'description': description,
      'gender': gender,
      'fullName': fullName,
      'avatarUrl': avatarUrl,
      'role': role,
      'status': status,
      'jwtToken': jwtToken,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'] != null ? map['id'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      avatarUrl: map['avatarUrl'] != null ? map['avatarUrl'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      status: map['status'] != null ? map['status'] as bool : null,
      jwtToken: map['jwtToken'] != null ? map['jwtToken'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Account(id: $id, phone: $phone, description: $description, gender: $gender, fullName: $fullName, avatarUrl: $avatarUrl, role: $role, status: $status, jwtToken: $jwtToken)';
  }

  @override
  bool operator ==(covariant Account other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.phone == phone &&
        other.description == description &&
        other.gender == gender &&
        other.fullName == fullName &&
        other.avatarUrl == avatarUrl &&
        other.role == role &&
        other.status == status &&
        other.jwtToken == jwtToken;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        phone.hashCode ^
        description.hashCode ^
        gender.hashCode ^
        fullName.hashCode ^
        avatarUrl.hashCode ^
        role.hashCode ^
        status.hashCode ^
        jwtToken.hashCode;
  }
}
