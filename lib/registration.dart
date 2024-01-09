// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisrationPage(),
     ); 
  }
}

// ignore: use_key_in_widget_constructors
class RegisrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegisrationPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _register() async {
    //final responce= await http.post('http://127.0.0.1:8000/register',
    final response = await http.post(
      'http://127.0.0.1:8000/register'
          as Uri, // Update with your registration endpoint
      body: {
        'name': _usernameController.text,
        'email':_emailController.text,
        'password': _passwordController.text,
      },
    );
    // ignore: avoid_print
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Regisration Page'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 250, // Set your desired width
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 250, // Set your desired width
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'E-Mail',
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white
                  ),
                ),
              ),
            ),
            
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 250, // Set your desired width
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white
                  ),
                  obscureText: true,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 240, 245, 247)
              ),
              child:Text
              ('Register',
              style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
