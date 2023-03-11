import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/getx_example_1/Controller/shopping_controller.dart';

import '../Controller/cart_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});

  // Controller를 Dependency Injection 한다.
  // 이 D.I를 통해서 원할 때 언제든지 shoppingController를 통해서
  // 데이터를 가져올 수 있게 된다.
  // 이후에는, 리스트 뷰가 항상 shoppingController가 가지고 있는 데이터를
  // listen하게 만들어 준다.
  final shoppingController = Get.put(ShoppingController());

  // 일단 Controller를 만들고 D.I되면 다시 생성할 필요는 없다.
  // 설령 다른 페이지로 이동해도 Get.find() 메서드로 얼마든지 컨트롤러를 불러올 수 있기 때문이다.
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          // Column 내에서 ListView Widget을 불러왔을 때,
          // 반드시 Expanded로 감싸야만 정상적으로 출력된다.
          Expanded(
            // ListView를 GetX Widget으로 감싸 listen하게 만들어준다.
            // 그런데, GetX로 한 번에 감싸게 되면 builder 등을 불러와서 코딩할 때
            // 헷갈릴 수도 있다. 그러므로 먼저 StreamBuilder 위젯으로 감싼다음,
            // GetX<ShoppingController>로 변경해준다.
            // 이렇게 설정하면, controller로부터 모든 데이터를 가져오게 될 것이다.
            child: GetX<ShoppingController>(builder: (controller) {
              return Scrollbar(
                child: ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.products[index].productName,
                                      style: const TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      controller
                                          .products[index].productDescription,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  '\$${controller.products[index].price}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ),
                                )
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // 메서드를 호출할 때는 D.I된 controller 직접 호출,
                                // 데이터를 얻을 때는 GetX로 감싼 controller 사용?
                                cartController
                                    .addToItem(controller.products[index]);
                              },
                              child: const Text(
                                'Add To Cart',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
          const SizedBox(
            height: 30,
          ),
          // 새롭게 생성한 CartController를 적용하여
          // 업데이트되도록 한다.
          GetX<CartController>(builder: (controller) {
            return Text(
              'Total Amount: \$${controller.totalPrice}',
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            );
          }),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(builder: (controller) {
          return Text(
            cartController.itemNumber.toString(),
            style: const TextStyle(
              fontSize: 20,
            ),
          );
        }),
        icon: const Icon(Icons.shopping_cart),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
