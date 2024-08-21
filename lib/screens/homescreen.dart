import 'package:flutter/material.dart';
import 'CalculatorScreen.dart';
import 'ShowTimeScreen.dart';
import 'WeatherScreen.dart';
import 'SettingsScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Multi-Tasking App',
            style: TextStyle(
              fontSize: 30, // Adjust the font size as needed
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Image.asset('assets/logo1.png', fit: BoxFit.cover, height: 400),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              icon: Icon(Icons.home_filled, size: 40, color: Colors.blue[900]),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculatorScreen()),
                );
              },
              icon: Icon(Icons.calculate, size: 40, color: Colors.blue[900]),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowTimeScreen()),
                );
              },
              icon: Icon(Icons.calendar_month_rounded, size: 40, color: Colors.blue[900]),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WeatherScreen()),
                );
              },
              icon: Icon(Icons.cloud_done, size: 40, color: Colors.blue[900]),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
              icon: Icon(Icons.settings, size: 40, color: Colors.blue[900]),
            ),
          ],
        ),
      ),
    );
  }
}


