import 'package:flutter/material.dart';

class SelectProfile extends StatefulWidget {
  @override
  _SelectProfileState createState() => _SelectProfileState();
}

class _SelectProfileState extends State<SelectProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [Text('Shipper'), Text('Lorem ipsum')],
    )));
  }
}
