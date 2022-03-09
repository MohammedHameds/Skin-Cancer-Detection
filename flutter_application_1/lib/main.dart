import 'package:flutter/material.dart';
import 'package:s1/Home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Augustus',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
