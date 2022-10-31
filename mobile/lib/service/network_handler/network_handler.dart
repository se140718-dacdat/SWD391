import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NetworkHandler {
  static final client = http.Client();
  static const storage = FlutterSecureStorage();

  static Future<String> post(var body, String endPoint) async {
    var response = await client.post(buildUri(endPoint), body: body, headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    debugPrint(response.body);
    print(response.body);
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
    String host = "https://10.0.2.2:5001/api/";
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
