// UI에 바인드하기를 원하는 요소를 지정한다.
import 'package:get/get.dart';
import '../Model/product.dart';

class ShoppingController extends GetxController {
  // null safety 적용 이후, product에 Product type의 List를 선언하는 방법이다.
  // List 관련 데이터를 Observable로 만들어준다.
  // Observable로 만들어주면, 데이터가 바뀌자마자 자동으로 UI가 업데이트 될 수 있다.
  var products = <Product>[].obs;

  // onInit을 이용하면 원하는 특정 명령을, 컨트롤러가 생성될 때 실행할 수 있다.
  // 현재 우리는 서버에서 데이터를 가져온다고 가정을 하기 때문에, 원래대로라면
  // product에 데이터를 담기 위한 API를 불러와야 할 것이다.
  // 하지만 현재는 그런 상황을 가정하고 있으므로, 약간의 시간이 걸리도록 설정해주자.
  // [이것을 이용해서 내 서비스에서 DB로부터 처음에 데이터를 가져오는 것을 구현할 수 있지 않을까?]
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  // 서버에서 데이터를 가져오는 역할이므로, 당연히 async가 된다.
  void fetchData() async {
    // 2초 후에 데이터가 전달된다. (가정)
    // 데이터도 임의로 생성해본다.
    await Future.delayed(const Duration(seconds: 2));
    var productData = [
      Product(
        id: 1,
        productName: 'Mouse',
        productDescription: 'some Description about product',
        price: 30,
      ),
      Product(
        id: 2,
        productName: 'Keyboard',
        productDescription: 'some Description about product',
        price: 40,
      ),
      Product(
        id: 3,
        productName: 'Monitor',
        productDescription: 'some Description about product',
        price: 620,
      ),
      Product(
        id: 4,
        productName: 'Ram',
        productDescription: 'some Description about product',
        price: 80,
      ),
      Product(
        id: 5,
        productName: 'Speaker',
        productDescription: 'some Description about product',
        price: 120.5,
      ),
    ];

    // Observable로 설정한 products는 assignAll이라는 메서드를 이용할 수 있고,
    // 여기에 productData를 전달해주면 된다. assignAll을 이용하면 아이템을 모두 새롭게 대체한다.
    products.assignAll(productData);
  }
}
