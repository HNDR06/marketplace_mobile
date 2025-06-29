import 'dart:convert';

import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // String baseUrl = 'https://shamo-backend.buildwithangga.id/api';
  String baseUrl = 'http://127.0.0.1:8000/api';


  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/register');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      // UserModel fields are final, so create a new instance with token
      user = UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        username: user.username,
        profilePhotoUrl: user.profilePhotoUrl,
        token: 'Bearer ${data['access_token']}',
      );
      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user = UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        username: user.username,
        profilePhotoUrl: user.profilePhotoUrl,
        token: 'Bearer ${data['access_token']}',
      );
      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
