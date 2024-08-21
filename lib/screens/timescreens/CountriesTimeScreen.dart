// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:timezone/standalone.dart' as tz;
// // //mport 'package:timezone/data/latest.dart' as tz; // For timezone data

// // class CountriesTimeScreen extends StatelessWidget {
// //    CountriesTimeScreen({super.key});

// //   final Map<String, String> _countriesTimezones = {
// //     'New York': 'America/New_York',
// //     'London': 'Europe/London',
// //     'Tokyo': 'Asia/Tokyo',
// //     'Sydney': 'Australia/Sydney',
// //   };

// //   @override
// //   Widget build(BuildContext context) {
// //     final timeFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Country Time-Zones',style: TextStyle(color: Colors.white),),
// //         backgroundColor: Colors.indigo[400],
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back,color: Colors.white,),
// //           onPressed: () {
// //             Navigator.pop(context); // Navigate back to the previous screen
// //           },
// //         ),
// //       ),
// //       body:Container(
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(
// //             colors: [Colors.blueAccent, Colors.red],
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //           ),
// //         ),
// //           // Time display overlay
// //            child: ListView(
// //             padding: EdgeInsets.all(16),
// //             children: _countriesTimezones.entries.map((entry) {
// //               final city = entry.key;
// //               final timezone = entry.value;
// //               final currentTime = tz.TZDateTime.now(tz.getLocation(timezone));
// //               return Card(
// //                 margin: EdgeInsets.symmetric(vertical: 8),
// //                 child: ListTile(
// //                   contentPadding: EdgeInsets.all(16),
// //                   title: Text(city, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //                   subtitle: Text(timeFormatter.format(currentTime)),
// //                   tileColor: Colors.red[100],
                  
// //                 ),
// //               );
// //             }).toList(),
// //           ),
        
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:timezone/standalone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz; // Use this for timezone data



// class CountriesTimeScreen extends StatelessWidget {
//   CountriesTimeScreen({super.key});

//   final Map<String, String> _countriesTimezones = {
//     'New York': 'America/New_York',
//     'London': 'Europe/London',
//     'Tokyo': 'Asia/Tokyo',
//     'Sydney': 'Australia/Sydney',
//   };

//   @override
//   Widget build(BuildContext context) {
//     final timeFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Country Time-Zones', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.indigo[400],
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context); // Navigate back to the previous screen
//           },
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blueAccent, Colors.red],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         // Time display overlay
//         child: ListView(
//           padding: EdgeInsets.all(16),
//           children: _countriesTimezones.entries.map((entry) {
//             final city = entry.key;
//             final timezone = entry.value;
//             final currentTime = tz.TZDateTime.now(tz.getLocation(timezone));
//             return Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(40), // Curved corners
//                 child: Card(
//                   elevation: 4, // Optional: Adjust shadow for better visibility
//                   child: ListTile(
//                     contentPadding: EdgeInsets.all(16),
//                     title: Text(city, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                     subtitle: Text(timeFormatter.format(currentTime)),
//                     tileColor: Colors.red[100],
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/standalone.dart' as tz; // For timezone data

class CountriesTimeScreen extends StatefulWidget {
  CountriesTimeScreen({super.key});

  @override
  _CountriesTimeScreenState createState() => _CountriesTimeScreenState();
}

class _CountriesTimeScreenState extends State<CountriesTimeScreen> {
  String? _selectedCountry;
  DateTime? _currentTime;

  final Map<String, String> _countriesTimezones = {
    'New York': 'America/New_York',
    'London': 'Europe/London',
    'Tokyo': 'Asia/Tokyo',
    'Sydney': 'Australia/Sydney',
    'Paris': 'Europe/Paris',
    'Berlin': 'Europe/Berlin',
    'Rome': 'Europe/Rome',
    'Moscow': 'Europe/Moscow',
    'Dubai': 'Asia/Dubai',
    'Beijing': 'Asia/Shanghai',
    'Hong Kong': 'Asia/Hong_Kong',
    'Mumbai': 'Asia/Kolkata',
    'Seoul': 'Asia/Seoul',
    'Singapore': 'Asia/Singapore',
    'Buenos Aires': 'America/Argentina/Buenos_Aires',
    'Rio de Janeiro': 'America/Sao_Paulo',
    'Mexico City': 'America/Mexico_City',
    'Toronto': 'America/Toronto',
    'Vancouver': 'America/Vancouver',
    'Los Angeles': 'America/Los_Angeles',
  };

  @override
  void initState() {
    super.initState();
    _selectedCountry = _countriesTimezones.keys.first;
    _updateTime();
  }

  void _updateTime() {
    if (_selectedCountry != null) {
      final timezone = _countriesTimezones[_selectedCountry]!;
      setState(() {
        _currentTime = tz.TZDateTime.now(tz.getLocation(timezone));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeFormatter = DateFormat('dd-MM-yy HH:mm:ss');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Time-Zones', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo[400],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              DropdownButton<String>(
                value: _selectedCountry,
                items: _countriesTimezones.keys.map((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCountry = newValue;
                    _updateTime();
                  });
                },
                isExpanded: true,
                hint: Text('Select a Country'),
              ),
              SizedBox(height: 20),
              if (_currentTime != null)
                Text(
                  'Current Time in $_selectedCountry:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              if (_currentTime != null)
                Text(
                  DateFormat('dd-MM-yyyy \n HH:mm:ss').format(_currentTime!),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
