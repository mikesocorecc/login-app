import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl =
      'demo.dmh-us.com'; // Ejemplo de URL válida con el esquema 'http'
  // Create storage
  final storage = new FlutterSecureStorage();

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };

    final url = Uri.https(_baseUrl, '/api/login');
    final resp = await http.post(url, body: authData);
    final Map<String, dynamic> decodedRes = await json.decode(resp.body);
    if (decodedRes.containsKey('success')) {
      return decodedRes['message'];
    }

    final userJson = json.encode(decodedRes['data']['user']);
    final roleJson = json.encode(decodedRes['data']['role']);
    await storage.write(key: 'token', value: decodedRes['data']['token']);
    await storage.write(key: 'user', value: userJson);
    await storage.write(key: 'role', value: roleJson);

    return null;
  }

  Future logout() async {
    // Delete value
    await storage.delete(key: 'token');
    await storage.delete(key: 'user');
    await storage.delete(key: 'role');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}
