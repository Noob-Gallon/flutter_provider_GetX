import 'package:get/get.dart';

import './model.dart';

class Controller extends GetxController {
  // 실제적인 state management가 여기서 이루어짐

  final person = Person().obs;

  void updateInfo() {
    // 이전에 사용했던 GetBuilder를 리빌드시키는
    // update와는 다른 메서드이다.
    person.update((val) {
      val?.age++;
      val?.name = 'Coding Chef';
    });
  }
}
