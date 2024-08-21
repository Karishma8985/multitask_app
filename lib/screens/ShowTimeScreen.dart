import 'package:flutter/material.dart';
import 'timescreens/CountriesTimeScreen.dart';
import 'timescreens/CurrentTimeScreen.dart';
import 'timescreens/Hours12FormatScreen.dart';
import 'timescreens/Hours24FormatScreen.dart';

class ShowTimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Time', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 25, 60, 126),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/time.jpg', // Replace with your background image path
              fit: BoxFit.cover,
            ),
          ),
          // ListView for the options
          ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              _buildAnimatedListTile(
                context,
                title: 'Current Time',
                screen: CurrentTimeScreen(),
                color: Color.fromARGB(255, 125, 186, 233),
              ),
              _buildAnimatedListTile(
                context,
                title: 'Different Countries Time',
                screen: CountriesTimeScreen(),
                color: Color.fromARGB(255, 125, 186, 233),
              ),
              _buildAnimatedListTile(
                context,
                title: '24 Hours Format',
                screen: Hours24FormatScreen(),
                color: Color.fromARGB(255, 125, 186, 233),
              ),
              _buildAnimatedListTile(
                context,
                title: '12 Hours Format',
                screen: Hours12FormatScreen(),
                color: Color.fromARGB(255, 125, 186, 233),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedListTile(BuildContext context, {required String title, required Widget screen, required Color color}) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 500),
      child: Align(
        alignment: Alignment.centerLeft, // Align to the left side
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5, // Width will be half of the screen width
          margin: EdgeInsets.symmetric(vertical: 8), // Margin between tiles
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => screen),
              );
            },
            child: ListTile(
              contentPadding: EdgeInsets.all(35),
              title: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Color.fromARGB(255, 25, 60, 126),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
