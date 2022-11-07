import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NetworkHandler {
  static final client = http.Client();
  static const storage = FlutterSecureStorage();

  static Future<String> post(var body, String endPoint, String token) async {
    var response = await client.post(buildUri(endPoint), body: body, headers: {
      "Accept": "application/json",
      "content-type": "application/json; charset=utf-8",
      "access-control-allow-origin": "*",
      "Authorization": "Bearer $token",
    });
    // debugPrint(response.body);
    return response.body;
  }

  static Future<String> postWithToken(
      var body, String endPoint, String token) async {
    var response = await client.post(buildUri(endPoint), body: body, headers: {
      "Accept": "application/json",
      "content-type": "application/json; charset=utf-8",
      "access-control-allow-origin": "*",
      "Authorization": "Bearer $token",
    });
    // debugPrint(response.body);
    return response.body;
  }

  static Future<String> get(String endPoint, String token) async {
    var response = await client.get(buildUri(endPoint), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      "Authorization": "Bearer $token",
    });
    return response.body;
  }

  static Uri buildUri(String endPoint) {
    // String host = "https://10.0.2.2:5001/api/"; //Android Emulator
    // String host = "https://192.168.101.54:5001/api/"; //Real Emulator
    String host = "http://nguyenxuanthuan-001-site1.htempurl.com/api/";
    final apiPath = host + endPoint;
    return Uri.parse(apiPath);
  }

  static Future<void> storeToken(String token) async {
    await storage.write(key: "jwtToken", value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: "jwtToken");
  }
}
