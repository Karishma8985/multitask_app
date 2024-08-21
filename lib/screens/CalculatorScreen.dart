import 'package:flutter/material.dart';
import 'calscreens/age/AgeCalculatorScreen.dart';
import 'calscreens/cal/SimpleCalculatorScreen.dart';
import 'calscreens/bmi/BMICalculatorScreen.dart';
import 'calscreens/currency/CurrencyConverterScreen.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Calculator'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: const Color.fromARGB(255, 241, 233, 160),
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 16.0, // Space between columns
            mainAxisSpacing: 16.0, // Space between rows
            childAspectRatio: 1, // Aspect ratio for tiles
          ),
          itemCount: _tiles.length,
          itemBuilder: (context, index) {
            final tile = _tiles[index];
            return _buildTile(
              context,
              imagePath: tile['imagePath']!,
              screen: tile['screen']!,
              title: tile['title']!,
            );
          },
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> _tiles = [
    {
      'imagePath': 'assets/age12.png',
      'screen': AgeCalculatorPage(),
      'title': 'Age Calculator',
    },
    {
      'imagePath': 'assets/calci.jpg',
      'screen': SimpleCalculatorScreen(),
      'title': 'Simple Calculator',
    },
    {
      'imagePath': 'assets/bmical.jpg',
      'screen': BMICalculatorScreen(),
      'title': 'BMI Calculator',
    },
    {
      'imagePath': 'assets/currency.jpg',
      'screen': CurrencyConverterScreen(),
      'title': 'Currency Converter',
    },
  ];

  Widget _buildTile(BuildContext context, {required String imagePath, required Widget screen, required String title}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                    
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
