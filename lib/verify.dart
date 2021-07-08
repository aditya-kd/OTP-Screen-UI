import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proj2/screens/login.dart';
import 'package:proj2/services/authservice.dart';
import 'package:proj2/uitheme.dart';
import 'package:sms_autofill/sms_autofill.dart';

bool codesent = false;
String? currNum;

class Verify extends StatefulWidget {
  Verify(String? newNum) {
    currNum = newNum;
  }
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  String phoneNo = '', verificationId = '', smsCode = '';

  @override
  void initState() {
    super.initState();
    _listenOTP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FocusData(),
    );
  }

  void _listenOTP() async {
    await SmsAutoFill().listenForCode;
    final signCode = SmsAutoFill().getAppSignature;
    print(signCode);
    codesent
        ? AuthService().signInWithOTP(smsCode, verificationId)
        : verifyPhone(currNum);
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (FirebaseAuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int? forceResend]) {
      this.verificationId = verId;
      setState(() {
        codesent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}

class FocusData extends StatefulWidget {
  @override
  _FocusDataState createState() => _FocusDataState();
}

class _FocusDataState extends State<FocusData> {
  String? _code = '';
  String enteredOTP = '';
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
            PinFieldAutoFill(
              codeLength: 6,
              currentCode: _code,
              onCodeChanged: (val) {
                enteredOTP = val!;
                print('AutoFillField: ' + val);
              },
            ),
            TextFieldPinAutoFill(
              currentCode: _code,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_code == enteredOTP) {
                    print('OTP Correct');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectProfile()));
                  }
                  print('verify pressed');
                },
                child: Text('VERIFY'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
