// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

class Product {
  String id;
  String name;
  double price;
  int quantity;
  String img;

  String description;

  String categoryID;

  Product(
    this.id,
    this.name,
    this.price,
    this.quantity,
    this.img,
    this.description,
    this.categoryID,
  );

  Product copyWith({
    String? id,
    String? name,
    double? price,
    int? quantity,
    String? img,
    String? description,
    String? categoryID,
  }) {
    return Product(
      id ?? this.id,
      name ?? this.name,
      price ?? this.price,
      quantity ?? this.quantity,
      img ?? this.img,
      description ?? this.description,
      categoryID ?? this.categoryID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'img': img,
      'description': description,
      'categoryID': categoryID,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['id'] as String,
      map['name'] as String,
      map['price'] as double,
      map['quantity'] as int,
      map['img'] as String,
      map['description'] as String,
      map['categoryID'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, quantity: $quantity, img: $img, description: $description, categoryID: $categoryID)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.price == price &&
        other.quantity == quantity &&
        other.img == img &&
        other.description == description &&
        other.categoryID == categoryID;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        quantity.hashCode ^
        img.hashCode ^
        description.hashCode ^
        categoryID.hashCode;
  }
}

//C01: Tủ Lạnh
//C02: TV
//C03: Máy giặt
//C04: Bếp gas
List<Product> products = [
  Product(
      "P01",
      'Test',
      50,
      20,
      "assets/images/TV.png",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "C01"),
  Product("P02", 'Hitachi', 50, 1, "assets/images/TuLanh.png", "Good", "C02"),
  Product("P03", 'Toshiba', 139, 1, "assets/images/MayGiat.png", "Good", "C03"),
  Product("P04", 'Honda', 1, 1, "assets/images/MayGiat.png", "Good", "C03"),
  Product("P05", 'Toyota', 50, 1, "assets/images/TuLanh.png", "Good", "C02"),
  Product("P06", 'Daikin', 100, 1, "assets/images/TV.png", "Good", "C01"),
  Product("P07", 'Suzuki', 50, 1, "assets/images/TuLanh.png", "Good", "C02"),
  Product(
      "P08", 'Electrolux', 50, 1, "assets/images/MayGiat.png", "Good", "C03"),
  Product("P09", 'Yamaha', 50, 1, "assets/images/TV.png", "Good", "C01"),
  Product("P10", 'BMW', 50, 1, "assets/images/BepGas.png", "Good", "C04"),
  Product("P11", 'Mercedes', 50, 1, "assets/images/BepGas.png", "Good", "C04"),
  Product("P12", 'MOG', 50, 1, "assets/images/MayGiat.png", "Good", "C03"),
  Product("P13", 'RX', 50, 1, "assets/images/TuLanh.png", "Good", "C02"),
  Product("P14", 'Audi', 50, 1, "assets/images/TV.png", "Good", "C01"),
  Product("P15", 'RX', 50, 1, "assets/images/MayGiat.png", "Good", "C03"),
  Product("P16", 'HHAHAHA', 50, 1, "assets/images/BepGas.png", "Good", "C04"),
];
