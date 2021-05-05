import 'package:dscapp/animation.dart';
import 'package:flutter/material.dart';
import 'package:dscapp/First.dart';
import 'package:dscapp/Second.dart';
import 'package:dscapp/HeroDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedContainerPage(),
      routes: {
        '/first': (context) => FirstPage(),
        '/second': (context) => MyPage(),
        '/third': (context) => AnimatedContainerPage(),
        '/fourth': (context) => AnimatedContainerSecondPage()
      },
    );
  }
}