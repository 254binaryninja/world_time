// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    // Check if the arguments are non-null and of the correct type
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is Map<String, dynamic>) {
      data = args;
    } else {
      data = {}; // Provide a default value
    }
    print(data);

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';

    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 2.0),
          child: Column(children: [
            Text('Home Screen'),
            ElevatedButton.icon(
              onPressed: () async {
                dynamic result =
                    await Navigator.pushNamed(context, '/Location');
                if (result != null) {
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDayTime': result['isDayTime'],
                      'choose': result['choose'],
                    };
                  });
                }
              },
              icon: Icon(Icons.edit_location),
              label: Text('Choose Location'),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['location'],
                  style: GoogleFonts.audiowide(
                    textStyle: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              data['time'],
              style: GoogleFonts.audiowide(
                textStyle: TextStyle(
                  fontSize: 66.0,
                  letterSpacing: 2.0,
                  color: Colors.white,
                ),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
