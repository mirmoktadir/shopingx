import 'package:http/http.dart' as http;
import 'package:shopingx/models/product_model.dart';

class ApiServices {
  static var client = http.Client();
  static Future<List<Product>> fetchProducts() async {
    var response = await client.get(
      Uri.parse(
          'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      return productFromJson(data);
    } else {
      return null;
    }
  }
}
