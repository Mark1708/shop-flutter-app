import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import '../model/category_model.dart';

class CategoryService {
  final categoryURL = "http://localhost:8080/market/category";

  Future<List<Category>> getAll() async {
    Response res = await get(Uri.parse(categoryURL + "/all"));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));

      List<Category> categories = body
          .map(
            (dynamic item) => Category.fromJson(item),
          ).toList();
      return categories;
    } else {
      throw "Unable to retrieve categories.";
    }
  }


}