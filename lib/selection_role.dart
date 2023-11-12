import 'package:flutter/material.dart';
import 'package:app_quiz/user_login.dart';
import 'package:app_quiz/admin_homescreen.dart';

import 'admin_login.dart';
import 'login.dart';

void main() {
  runApp(SelectionScreen());
}
class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        hintColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.lightBlue,
        ),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Panel Selection'),
          ),
          body: Container(
            color: Colors.white, // White background
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Select your panel based on your preferences.',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Evenly distribute the panels
                  children: [
                    Container(
                      width: 150.0, // Specify the width
                      height: 150.0, // Specify the height
                      child: PanelCard(
                        icon: Icons.person,
                        label: 'Admin',
                      ),
                    ),
                    SizedBox(width: 20.0), // Gap between panels
                    Container(
                      width: 150.0, // Specify the width
                      height: 150.0, // Specify the height
                      child: PanelCard(
                        icon: Icons.school,
                        label: 'User',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}

class PanelCard extends StatelessWidget {
  final IconData icon;
  final String label;

  PanelCard({
    required this.icon,
    required this.label,
  });
  void _handlePanelTap(BuildContext context) {
    // Add your desired action here when the panel is tapped.
    // For example, you can navigate to a new screen.

  }

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handlePanelTap(context),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200], // Light grey background
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.0,
              color: Colors.lightBlue, // Purple icon
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

