// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

class Product {
  final String id, name, description, img;
  final double price;
  final int quantity;
  final String categoryID;

  Product(this.id, this.name, this.price, this.quantity, this.img,
      this.description, this.categoryID);
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
      "https://www.electrolux.vn/globalassets/appliances/fridge/vn-eqe6000a-b-fr-cl-1500x1500.png",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "C01"),
  Product(
      "P02",
      'Hitachi',
      50,
      1,
      "https://cdn.tgdd.vn/Products/Images/1942/275512/google-sony-4k-55-inch-kd-55x75k-310322-034642-550x340.png",
      "Good",
      "C02"),
  Product(
      "P03",
      'Toshiba',
      139,
      1,
      "https://www.electrolux.vn/globalassets/appliances/washing-machines/vn/ewf9024p5sb/vn-ewf9024p5sb-fr-cl-1500x1500.png",
      "Good",
      "C03"),
  Product(
      "P04",
      'Honda',
      1,
      1,
      "https://www.electrolux.vn/globalassets/appliances/washing-machines/vn/ewf9024p5sb/vn-ewf9024p5sb-fr-cl-1500x1500.png",
      "Good",
      "C03"),
  Product(
      "P05",
      'Toyota',
      50,
      1,
      "https://cdn.tgdd.vn/Products/Images/1942/275512/google-sony-4k-55-inch-kd-55x75k-310322-034642-550x340.png",
      "Good",
      "C02"),
  Product(
      "P06",
      'Daikin',
      100,
      1,
      "https://www.electrolux.vn/globalassets/appliances/fridge/vn-eqe6000a-b-fr-cl-1500x1500.png",
      "Good",
      "C01"),
  Product(
      "P07",
      'Suzuki',
      50,
      1,
      "https://cdn.tgdd.vn/Products/Images/1942/275512/google-sony-4k-55-inch-kd-55x75k-310322-034642-550x340.png",
      "Good",
      "C02"),
  Product(
      "P08",
      'Electrolux',
      50,
      1,
      "https://www.electrolux.vn/globalassets/appliances/washing-machines/vn/ewf9024p5sb/vn-ewf9024p5sb-fr-cl-1500x1500.png",
      "Good",
      "C03"),
  Product(
      "P09",
      'Yamaha',
      50,
      1,
      "https://www.electrolux.vn/globalassets/appliances/fridge/vn-eqe6000a-b-fr-cl-1500x1500.png",
      "Good",
      "C01"),
  Product(
      "P10",
      'BMW',
      50,
      1,
      "https://www.electrolux.vn/globalassets/appliances/stovehob/etg729gktr_vn_700x700-cropped.png",
      "Good",
      "C04"),
  Product(
      "P11",
      'Mercedes',
      50,
      1,
      "https://www.electrolux.vn/globalassets/appliances/stovehob/etg729gktr_vn_700x700-cropped.png",
      "Good",
      "C04"),
  Product(
      "P12",
      'MOG',
      50,
      1,
      "https://www.electrolux.vn/globalassets/appliances/washing-machines/vn/ewf9024p5sb/vn-ewf9024p5sb-fr-cl-1500x1500.png",
      "Good",
      "C03"),
  Product(
      "P13",
      'RX',
      50,
      1,
      "https://cdn.tgdd.vn/Products/Images/1942/275512/google-sony-4k-55-inch-kd-55x75k-310322-034642-550x340.png",
      "Good",
      "C02"),
  Product(
      "P14",
      'Audi',
      50,
      1,
      "https://www.electrolux.vn/globalassets/appliances/fridge/vn-eqe6000a-b-fr-cl-1500x1500.png",
      "Good",
      "C01"),
  Product(
      "P15",
      'RX',
      50,
      1,
      "https://www.electrolux.vn/globalassets/appliances/washing-machines/vn/ewf9024p5sb/vn-ewf9024p5sb-fr-cl-1500x1500.png",
      "Good",
      "C03"),
  Product(
      "P16",
      'HHAHAHA',
      50,
      1,
      "https://www.electrolux.vn/globalassets/appliances/stovehob/etg729gktr_vn_700x700-cropped.png",
      "Good",
      "C04"),
];
