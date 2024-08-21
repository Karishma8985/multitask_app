import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AgeCalculatorPage extends StatefulWidget {
  const AgeCalculatorPage({super.key});

  @override
  State<AgeCalculatorPage> createState() => _AgeCalculatorPageState();
}

class _AgeCalculatorPageState extends State<AgeCalculatorPage> {
  String myAge = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[800],
      appBar: AppBar(
        title: const Text("Age Calculator"),
        centerTitle: true,
        backgroundColor: Colors.purple[200],
        
      ),
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/age_bg.png', 
            fit: BoxFit.cover,
            
          ),
          
          // Foreground content
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 250.0, left: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  const Text(
                    'How old are you??\n        You are',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    myAge,
                    style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(221, 235, 228, 228),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => pickDob(context),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 3, 45, 231),
                      backgroundColor: Colors.purple[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text(
                      'Pick Your Date of Birth',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void pickDob(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate != null) {
        calculateAge(pickedDate);
      }
    });
  }

  void calculateAge(DateTime birth) {
    DateTime now = DateTime.now();
    Duration age = now.difference(birth);
    int years = age.inDays ~/ 365;
    int months = (age.inDays % 365) ~/ 30;
    int days = (age.inDays % 365) % 30;
    setState(() {
      myAge = '$years years \n$months months \n$days days \n OLD';
    });
  }
}
