// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/DashboardScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Map<String, String> errors = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTextField('Username', _usernameController, 'name'),
                buildTextField('Email', _emailController, 'email'),
                buildTextField('Password', _passwordController, 'password', true),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _registerUser,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text('Signup',
                  style:TextStyle(color: Colors.black),
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, String field, [bool isPassword = false]) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorText: errors[field],
        ),
        obscureText: isPassword,
      ),
    );
  }

  void _registerUser() async {
    setState(() {
      errors = {};
    });

    String name = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    String url = "http://127.0.0.1:8000/api/register";

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showErrorDialog('All fields are required.');
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );

     // print('Response Status Code: ${response.statusCode}');
      //print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        _showSuccess('User registered successfully!');
      } else if (response.statusCode == 422) {
        Map<String, dynamic> error = jsonDecode(response.body);
        if (error.containsKey('errors')) {
          Map<String, dynamic> errorsMap = error['errors'];
          errorsMap.forEach((field, errorMessage) {
            _showErrorDialog(errorMessage);
          });
        }
      }
    } catch (e) {
      print('Error during registration: $e');
      _showErrorDialog('Error during registration: $e');
    }
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardScreen(),
      ),
    );
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
