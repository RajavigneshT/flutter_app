// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_text_fields.dart';
import 'package:flutter_app/components/custom_button_field.dart';
import 'package:flutter_app/utils/network_util.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final NetworkUtil _networkUtil = NetworkUtil();

  Future<void> _register() async {
    await _networkUtil.register(
      _usernameController.text,
      _emailController.text,
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
        centerTitle: true,
      ),
     backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(controller: _usernameController, labelText: 'Username'),
              CustomTextField(controller: _emailController, labelText: 'EMail'),
              CustomTextField(controller: _passwordController, labelText: 'Password'),
              CustomButton(
                onPressed: _register,
                text: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
