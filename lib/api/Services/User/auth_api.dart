import 'dart:convert';

import 'package:explorer/api/base_api.dart';
import 'package:http/http.dart' as http;

class AuthAPI extends BaseAPI {
  Future<http.Response> createUser(
      String username, String email, String password) async {
    var body = jsonEncode(
        {"username": username, "email": email, "password": password});
    http.Response response = await http.post(Uri.parse(super.usersPath),
        headers: super.headers, body: body);
    return response;
  }

  Future<http.Response> loginUser(String username, String password) async {
    var body = jsonEncode({"username": username, "password": password});
    http.Response response = await http.post(Uri.parse(super.authPath),
        headers: super.headers, body: body);
    return response;
  }
}
