import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/getx_example_2/controller/controller.dart';
import 'package:getx_example/getx_example_2/view/product_tile.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chef Shop'),
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.view_list_rounded,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          // gridDelegate는 GridView가 어떤 모양을 가지게 될지를 결정해주는 인자이다.
          // SliverGridDelegateWithFixedCrossAxisCount라고 써주면, 그리드 뷰에
          // 기둥을 몇 개 만들 것인지를 결정할 수 있다. 2개로 지정한다.
          child: Obx(
            () => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // mainAxisSpacing과 crossAxisSpacing에 각각 10을 준다.
                // 이렇게 하면 우리가 원하는 대로 20개의 Grid가 나오는 것을 볼 수 있다.
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return ProductTile(
                  controller.productList[index],
                );
              },
              // 생성될 item의 개수를 지정한다.
              itemCount: controller.productList.length,
            ),
          ),
        ),
      ),
    );
  }
}
