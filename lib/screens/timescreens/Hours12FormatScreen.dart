import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'dart:async'; // For Timer

class Hours12FormatScreen extends StatefulWidget {
  @override
  _Hours12FormatScreenState createState() => _Hours12FormatScreenState();
}

class _Hours12FormatScreenState extends State<Hours12FormatScreen> {
  DateTime _currentTime = DateTime.now();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startClock();
  }

  void _startClock() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (mounted) {
        setState(() {
          _currentTime = DateTime.now();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timeFormatter = DateFormat('hh:mm:ss a');
    return Scaffold(
      appBar: AppBar(
        title: const Text('12-Hours Formate',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.indigo[400],
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
       body:Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.0),
                borderRadius: BorderRadius.circular(12),
              
              ),
              child: Text(
                timeFormatter.format(_currentTime),
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        
      ),
    );
  }
}