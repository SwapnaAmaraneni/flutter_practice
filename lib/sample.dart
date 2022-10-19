import 'package:first_flutter_app/boxdecoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Welcome to Flutter')),
          ),
          body: Column(
           
           children: [],
          ),
      ),
    );
  }
}
