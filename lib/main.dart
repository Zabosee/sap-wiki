import 'package:flutter/material.dart';
import 'package:sap_wiki/home_page.dart';
import 'package:sap_wiki/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp',
      darkTheme: ThemeData.dark(),
      home: StartScreen(),
    );
  }
}
