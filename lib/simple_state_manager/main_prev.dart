import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

void main2() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 이 방법을 이용하여 Controller class의 instance를 주입할 수 있다.
    // 이 방법을 사용하지 않으려면, GetBuilder 내에서 init 인자를 전달해주면 된다.
    // Controller controller = Get.put(Controller());

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetX'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<Controller>(
                // 이를 통해서 Controller의 instance를 설정하면
                // controller 라고 접근할 수 없으므로, 다른 방법을 사용해야 한다.
                // 아래와 같이 Get.find<T>().property 로 접근 가능하다.
                init: Controller(),
                builder: (_) => Text(
                  // 'Current value is : ${controller.x}',
                  'Current value is : ${Get.find<Controller>().x}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // 상단에 instance를 선언하고 Get.put을 사용해서 의존성 주입.
                  // 이를 사용하면 controller 객체로 접근이 가능하지만,
                  // GetBuilder의 init을 사용하면 접근할 수 없게 되므로, 아래와 같이 바꿔준다.
                  // controller.increment();
                  Get.find<Controller>().increment();
                },
                child: const Text('Add Number'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
