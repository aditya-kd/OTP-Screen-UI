import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proj2/EnterPhone.dart';
import 'EnterPhone.dart';
import 'uitheme.dart';

String currVal = 'English';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: basicTheme(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Please select your language',
              style: myHeadlineStyle,
            ),
            Text(
              'You can change it later',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            MyDropDown(),
            ElevatedButton(
              style: myBtnStyle,
              child: Text('NEXT'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EnterPhone()));
                print('Button Pressed');
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(currVal + " selected")));
              },
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyDropDown extends StatefulWidget {
  const MyDropDown({Key? key}) : super(key: key);
  @override
  _MyDropState createState() => _MyDropState();
}

class _MyDropState extends State<MyDropDown> {
  String dropValue = 'English';
  final List<DropdownMenuItem<String>>? items = <String>[
    'English',
    'Hindi',
    'German'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: items,
      value: currVal,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      onChanged: (String? newVal) {
        setState(() {
          currVal = newVal!;
        });
      },
      style: const TextStyle(color: Colors.black54),
      underline: null,
    );
  }
}
