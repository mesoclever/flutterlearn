import 'package:flutter/material.dart';
import 'package:fluttercocktail/homepage.dart';

const Color myColor = Colors.brown;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Cocktail App",
      theme: ThemeData(
        primarySwatch: Colors.brown,
        //fontFamily: "Pacifico"
      ),
      home: HomePage(),
    );
  }
}
