import 'package:flutter/material.dart';
import 'package:flutter_app/registration.dart'; // Update with the actual filename

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: RegisrationPage(),
    );
  }
}

void main() {
  runApp( MyApp());
}
