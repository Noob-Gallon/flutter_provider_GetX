import 'package:get/get.dart';

import '../Model/product.dart';

class CartController extends GetxController {
  // 이제 카트에 무언가를 담을 때마다 아이템이 추가되어야 하므로,
  // addToItem 이라는 메서드를 만들어준다.
  var cartItems = <Product>[].obs;

  // cartItems가 initialize 되기 전에는 접근할 수 없으므로,
  // getter를 사용해서 cartItems가 초기화 된 이후에 값을 가져오도록 만들어 준다.
  // 기존에 AlarmInformation에서 이 부분 때문에 문제가 됐었는데,
  // 똑같이 적용하면 될 것 같다.
  double get totalPrice =>
      cartItems.fold(0, ((previousValue, item) => previousValue + item.price));

  // item의 개수를 return 하는 getter를 사용한다.
  int get itemNumber => cartItems.length;

  // 이제 어디에서나 addToItem 메서드를 부르면
  // 그 즉시 cartItems가 업데이트 될 것이고,
  // 이 CartController를 listen하고 있는 UI는
  // 어디에 있던지 그 즉시 업데이트 될 것이다.

  // ------------------------------------------------------
  // 원하는 페이지에서 Get.put을 이용해 Controller를 D.I시키고
  // UI에 사용하면 될 것 같다.
  // ------------------------------------------------------
  // 라고 생각했는데, 굳이 그럴 필요 없이 Get.find() 메서드로 찾아서 사용하면 된다.
  // ------------------------------------------------------

  void addToItem(Product product) {
    cartItems.add(product);
  }
}
