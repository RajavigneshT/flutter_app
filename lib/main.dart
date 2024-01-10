// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
//import 'package:flutter_app/registration.dart'; // Update with the actual filename
import 'package:flutter_app/screens/registration_page.dart';

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: RegistrationPage(),
    );
  }
}

void main() {
  runApp( MyApp());
}
