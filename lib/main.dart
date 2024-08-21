import 'package:flutter/material.dart';
import 'package:multitask_app/screens/homescreen.dart';
import 'package:timezone/data/latest.dart' as tz; 

void main() {
  tz.initializeTimeZones();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        body: HomeScreen(),
      ),
    );
  }
}