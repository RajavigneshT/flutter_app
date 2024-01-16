// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;

class NetworkUtil {
  Future<void> register(String username, String email, String password) async {
    final response = await http.post(
      'http://127.0.0.1:8000/api/register' as Uri,
      body: {
        'name': username,
        'email': email,
        'password': password,
      },
    );
    print(response.body);
  }
}
