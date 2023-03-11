// 이름 지정
import 'package:getx_example/getx_example_2/model/product_model.dart';
import 'package:http/http.dart' as http;

class Services {
  // 실질적으로 HTTP 클라이언트와 상호작용하며
  // 데이터를 가져오는 기능을 구현한다.

  // 서버를 연결하고 닫을 때마다 매 번 HTTP Client를 생성하는 것은
  // 상당히 비효율적이기 때문에 client를 static으로 선언한다.
  static var client = http.Client();

  // HTTP 통신을 사용하기 때문에, 당연하게도
  // async 메서드가 된다.
  // 그런데, fetchProducts가 HTTP 통신을 통해
  // 가져와서 전달해 줄 데이터는 Product 타입의 리스트이다.
  // 그래서 데이터의 타입을 지정해준다.
  // async 메서드이므로, Future를 리턴해주어야 한다.

  // 추가로, fetchProducts가 null을 return하는 경우가 생길 수도 있는데,
  // 실제로 여기서 Future는 null이 될 수 없으므로, List<Product>를 null-able로 만들어준다.
  static Future<List<Product>?> fetchProducts() async {
    // HTTP 통신을 하려면, get(Uri.parse(...))를 사용한다.
    var response = await client.get(
      Uri.parse(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline',
      ),
    );

    if (response.statusCode == 200) {
      // 데이터 get 성공, jsonData로 들어온 데이터를
      // model로 전달해주어야 한다.
      var jsonData = response.body;
      return productFromJson(jsonData);
    } else {
      return null;
    }
    return null;
  }
}
