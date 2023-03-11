import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Controller extends GetxController {
  // 앞에다가 _를 붙이면 private 변수로 선언된다.
  int _x = 0;
  // getter를 사용하여 private 변수 x의 값을 외부에서 가져갈 수 있도록 설정.
  int get x => _x;

  void increment() {
    _x++;
    update();
  }

  person() {}
}
