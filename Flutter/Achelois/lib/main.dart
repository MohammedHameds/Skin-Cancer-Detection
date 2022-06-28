import 'package:flutter/material.dart';
import 'package:s1/Home.dart';
import 'package:s1/models/about.dart';
import 'package:s1/models/cancer_image.dart';
import 'package:s1/models/condition1.dart';
import 'package:s1/models/condition2.dart';
import 'package:s1/models/condition3.dart';
import 'package:s1/models/condition4.dart';
import 'package:s1/models/condition5.dart';
import 'package:s1/models/display_data.dart';
import 'package:s1/models/humanbody.dart';
import 'package:s1/models/skin_test.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'skin cancer',
      home: Home(),
      routes: {
        'home' : (context)=> Home(),
        'test' : (context)=> Skin_Test(),
        'mydata' : (context)=> Mydata(),
        'humanbody' : (context)=> HumanBody(),
        'about' : (context)=> About(),
        'cancer' : (context)=>Cancer_Image(),
        'condition1' : (context)=>Condition1(),
        'condition2' : (context)=>Condition2(),
        'condition3' : (context)=>Condition3(),
        // 'condition4' : (context)=>Condition4(),
        'condition5' : (context)=>Condition5(),
        
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
