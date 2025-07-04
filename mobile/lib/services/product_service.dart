import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shamo/models/product_model.dart';

class ProductService {
  // String baseUrl = 'https://shamo-backend.buildwithangga.id/api';
  String baseUrl = 'http://127.0.0.1:8000/api';


  Future<List<ProductModel>> getProducts() async {
    var url = Uri.parse('$baseUrl/products');
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = data
          .map<ProductModel>((item) => ProductModel.fromJson(item))
          .toList();

      return products;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}
