import 'package:get/get.dart';
import '../data/services.dart';
import '../model/product_model.dart';

class Controller extends GetxController {
  // 이로써 API를 불러올 때마다 자동으로 UI를 업데이트 시킬 수 있게 되었다.
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    // static으로 선언된 Services class에서
    // HTTP 통신을 통해 지정한 URL으로부터 데이터를 parse해서 가져온다.
    var products = await Services.fetchProducts();

    if (products != null) {
      productList.value = products;
    }
  }
}
