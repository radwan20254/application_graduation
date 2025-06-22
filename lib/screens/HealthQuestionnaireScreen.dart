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
  bool _isFirstTimeRegistration = true;
  String? _chronicDisease;
  String? _smoker;
  String? _regularMedication;

  void _submitForm() {
    // You can also send the form data to backend here if needed
    print('Chronic Disease: $_chronicDisease');
    print('Smoker: $_smoker');
    print('Regular Medication: $_regularMedication');
  }

  bool _validateAnswers() {
    if (_chronicDisease == null ||
        _smoker == null ||
        _regularMedication == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please answer all questions before proceeding."),
          backgroundColor: Colors.redAccent,
        ),
      );
      return false;
    }
    return true;
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
            Image.asset('assets/IMG-20250226-WA0009-removebg-preview.png'),
            Text(
              'Good Morning, Lara',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildQuestion(
              question: 'Do you suffer from a chronic disease?',
              groupValue: _chronicDisease,
              onChanged: (val) => setState(() => _chronicDisease = val),
            ),
            _buildQuestion(
              question: 'Are you a smoker?',
              groupValue: _smoker,
              onChanged: (val) => setState(() => _smoker = val),
            ),
            _buildQuestion(
              question: 'Is there any medication that you take regularly?',
              groupValue: _regularMedication,
              onChanged: (val) => setState(() => _regularMedication = val),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_validateAnswers()) {
                    _submitForm();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationScreen2()),
                    );
                    setState(() {
                      _isFirstTimeRegistration = false;
                    });
                  }
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

  Widget _buildQuestion({
    required String question,
    required String? groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 16),
        ),
        Row(
          children: [
            Radio<String>(
              value: 'Yes',
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            Text('Yes'),
            Radio<String>(
              value: 'No',
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            Text('No'),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
