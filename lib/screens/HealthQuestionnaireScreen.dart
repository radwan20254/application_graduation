import 'package:diagnosify_app/screens/RegistrationScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _isFirstTimeRegistration = true; // Simulate first-time registration
  String? _chronicDisease;
  String? _smoker;
  String? _regularMedication;

  void _submitForm() {
    // Here you can add the logic to process the form data
    print('Chronic Disease: $_chronicDisease');
    print('Smoker: $_smoker');
    print('Regular Medication: $_regularMedication');
    // You can also navigate to another screen or show a success message
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: _buildHealthQuestionnaire(),
    );
  }

  Widget _buildHealthQuestionnaire() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/IMG-20250226-WA0009-removebg-preview.png',
            ),
            Text(
              'Good Morning, Lara',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Do you suffer from a chronic disease?',
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _chronicDisease,
                  onChanged: (String? value) {
                    setState(() {
                      _chronicDisease = value;
                    });
                  },
                ),
                Text('Yes'),
                Radio<String>(
                  value: 'No',
                  groupValue: _chronicDisease,
                  onChanged: (String? value) {
                    setState(() {
                      _chronicDisease = value;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Are you a smoker?',
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _smoker,
                  onChanged: (String? value) {
                    setState(() {
                      _smoker = value;
                    });
                  },
                ),
                Text('Yes'),
                Radio<String>(
                  value: 'No',
                  groupValue: _smoker,
                  onChanged: (String? value) {
                    setState(() {
                      _smoker = value;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Is there any medication that you take regularly?',
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _regularMedication,
                  onChanged: (String? value) {
                    setState(() {
                      _regularMedication = value;
                    });
                  },
                ),
                Text('Yes'),
                Radio<String>(
                  value: 'No',
                  groupValue: _regularMedication,
                  onChanged: (String? value) {
                    setState(() {
                      _regularMedication = value;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationScreen2()),
                  );
                  setState(() {
                    _isFirstTimeRegistration =
                        false; // Mark registration as complete
                  });
                },
                child: Text('Next',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 38, vertical: 12),
                  backgroundColor: Color(0xff048497),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
