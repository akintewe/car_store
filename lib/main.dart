import 'package:car_marketplace_ui/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CarApp());
}

class CarApp extends StatelessWidget {
  const CarApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
