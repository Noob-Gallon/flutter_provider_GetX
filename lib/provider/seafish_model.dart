import 'package:flutter/material.dart';

class SeaFishModel with ChangeNotifier {
  final String name;
  int tunaNumber;
  final String size;

  SeaFishModel({
    required this.name,
    required this.tunaNumber,
    required this.size,
  });

  void changeSeaFishNumber() {
    tunaNumber++;

    // Listener 들에게 notify를 알려줌.
    notifyListeners();
  }
}
