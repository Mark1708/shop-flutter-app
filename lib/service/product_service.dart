import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import '../model/product_model.dart';

class ProductService {
  final productURL = "http://localhost:8080/market/product";

  Future<List<Product>> getAll() async {
    Response res = await get(Uri.parse(productURL + "/all"));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));
      List<Product> products = body
            .map(
                (dynamic item) => Product.fromJson(item)
        ).toList();
      return products;
    } else {
      throw "Unable to retrieve products.";
    }
  }

  Future<List<Product>> getAllByCategoryId(int categoryId) async {
    var request = MultipartRequest('GET', Uri.parse('http://localhost:8080/market/product/all'));
    request.fields.addAll({
      'categoryId': categoryId.toString()
    });
    StreamedResponse res = await request.send();

    var responsed = await Response.fromStream(res);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(responsed.bodyBytes));
      List<Product> products = body
          .map(
              (dynamic item) => Product.fromJson(item)
      ).toList();
      return products;
    } else {
      throw "Unable to retrieve products.";
    }
  }
  
  // Demo
  Future<List<Product>> getPopular() async {
    Response res = await get(Uri.parse(productURL + "/all"));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));
      List<Product> products = body
          .map(
              (dynamic item) => Product.fromJson(item)
      ).where((element) => element.id % 2 == 0).toList();
      return products;
    } else {
      throw "Unable to retrieve products.";
    }
  }


}