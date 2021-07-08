import 'package:flutter/material.dart';

ThemeData basicTheme() {
  return ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.light,
      primaryColor: Colors.lightBlue[900],
      accentColor: Colors.cyan[600],
      // Define the default font family.
      fontFamily: 'Georgia',
      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ));
}

var myBtnStyle = ElevatedButton.styleFrom(
    primary: basicTheme().primaryColor,
    padding: EdgeInsets.all(20),
    textStyle: TextStyle(fontSize: 16),
    minimumSize: Size(200, 20));

var myHeadlineStyle = TextStyle(
  fontFamily: 'Georgia',
  fontSize: 30,
  color: Colors.black,
);

var mySubHeadingStyle = TextStyle(
  fontFamily: 'Georgia',
  fontSize: 20,
  color: Colors.grey,
);
