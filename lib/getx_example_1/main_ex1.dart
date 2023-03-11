import 'package:flutter/material.dart';
import 'View/shopping_page.dart';

void main2(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetX_Example_1',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ShoppingPage(),
    );
  }
}
