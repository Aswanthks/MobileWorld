// logo_page.dart
import 'package:flutter/material.dart';
import 'signup_page.dart'; // Import the SignupPage

class LogoPage extends StatelessWidget {
  const LogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/image/logo-color.png', // Your logo asset
              width: 200, // Adjust size as needed
              height: 200,
            ),
          ),
          Positioned(
            bottom: 20, // Adjust as needed to position the button
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => signuppage(), // Navigate to SignupPage
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Adjust padding as needed
                  textStyle: TextStyle(fontSize: 18), // Button text style
                ),
                child: Text('Get Started'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
