import 'package:flutter/material.dart';
import 'package:multitask_app/screens/weatherscreen/CurrentWeatherScreen.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Current Weather'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 31, 207, 207),
      ),
      
      body: CurrentWeatherScreen(),
      
    );
  }
}