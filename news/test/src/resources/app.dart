import 'package:flutter/material.dart';
import '../screens/NewsList.dart';

class App extends StatelessWidget{
  Widget build(context) {
    return MaterialApp(
      title: "News!",
      home: NewsList(),

    );
  }
}