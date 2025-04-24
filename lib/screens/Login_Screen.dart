// import 'package:diagnosify_app/screens/Chat_Screen.dart';
import 'package:diagnosify_app/screens/ForgotPassword.dart';
import 'package:diagnosify_app/screens/HealthQuestionnaireScreen.dart';
import 'package:diagnosify_app/screens/SignUp_Screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  'Welcome\nBack!',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Please Enter Your Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'National ID',
                hintText: 'Please Enter National ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Please Enter Your Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen()),
                );
                // Navigate to forgot password screen
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forgot Password? ',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    ' Click Here',
                    style: TextStyle(color: Color(0xff048497)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationScreen()),
                );
                // Handle sign in
              },
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff048497),
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
                // Navigate to sign up screen
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account? ',
                      style: TextStyle(color: Colors.black)),
                  Text(' Sign UP', style: TextStyle(color: Color(0xff048497))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
