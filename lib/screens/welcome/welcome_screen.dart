import 'package:flutter/material.dart';

import '../../components/buttons/custom_button.dart'; // Replace with the actual file path

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to MyApp!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Discover amazing features and tutorials to enhance your learning experience.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            Icon(
              Icons.school,
              size: 80,
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  icon: Icons.play_arrow,
                  text: 'Tutorial',
                  onPressed: () {
                    // Redirect to tutorial screen
                    // Add your navigation code here
                  },
                ),
                SizedBox(width: 20),
                CustomButton(
                  icon: Icons.arrow_forward,
                  text: 'Skip',
                  onPressed: () {
                    // Redirect to home screen
                    // Add your navigation code here
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
