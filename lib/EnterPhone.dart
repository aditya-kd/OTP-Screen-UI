import 'package:flutter/material.dart';
import 'package:proj2/input_phone.dart';
import 'package:proj2/uitheme.dart';

class EnterPhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bod: MainBodyText(),
    );
  }
}

class MainBodyText extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Please enter your phone number',
              style: myHeadlineStyle,
            ),
            Text(
              "You'll receice a 4-digit code to verify",
              style: mySubHeadingStyle,
            ),
            Container(
              alignment: Alignment.center,
              child: InputPhoneNumber(),
            ),
          ],
        ),
      ),
    );
  }
}

class InputPhoneNumber extends StatefulWidget {
  @override
  InputPhoneNumberState createState() => InputPhoneNumberState();
}

class InputPhoneNumberState extends State<InputPhoneNumber> {
  final _formKey = GlobalKey<FormState>();
  
  String phoneNo = '', verificationId = '', smsCode = '';

  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Column(
              children: [
                MyHomePage(),              
              ],
            ),
          ),
        ],
      ),
    );
  }
}