import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/reactive_state_manager/personal_card.dart';

void main2() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: PersonalCard(),
    );
  }
}
