import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> createProduct() async {
  try {
    final url = Uri.parse('https://fakestoreapi.com/products');

    Map<String, dynamic> new_product = {
      'title': 'PUMA shoe',
      'price': '50.99',
      'description': 'A brand new shoe',
      'category': 'fashion',
    };

    String product_json = json.encode(new_product);

    final response = await http.post(
      url,
      headers: {"Type": "post/json"},
      body: product_json,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('new product is now on the market');
      print('post succes code : ${response.statusCode}');
    } else {
      print('${response.statusCode} is not found');
    }
  } catch (e) {
    print('Error occurred: $e');
  }
}

Future<void> deleteProduct() async {
  try {
    final url = Uri.parse('https://fakestoreapi.com/products/1');

    final response = await http.delete(url);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('delete succes : ${response.statusCode}');
    } else {
      print('something went wrong status code ${response.statusCode}');
    }
  } catch (e) {
    print('error occured: $e');
  }
}

Future<void> putProduct() async {
  try {
    final url = Uri.parse('https://fakestoreapi.com/products/2');

    Map<String, dynamic> updated_product = {
      'title': 'iphone 16',
      'price': '799.0',
      'description': 'New launched iphone on the market',
      'category': 'electronics',
    };

    String update_json = json.encode(updated_product);

    final response = await http.put(
      url,
      headers: {'Type': "put/json"},
      body: update_json,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('PUT succes: ${response.statusCode}');
    } else {
      print('error: ${response.statusCode}');
    }
  } catch (e) {
    print('error occured: $e');
  }
}

void main() {
  createProduct();
  deleteProduct();
  putProduct();
}
