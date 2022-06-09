
import 'dart:math';

import 'package:shop_app/model/product_model.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/service/product_service.dart';

class CartService {

  final ProductService productService = ProductService();

  Future<List<Cart>> getCart() async {
    List<Product> all = await productService.getAll();
    all.shuffle();
    return all.sublist(0, 5).map(
            (Product product) {
              var num = new Random().nextInt(3);
              return new Cart(product: product, numOfItem: (num > 0) ? num : 1);
            }
    ).toList();
  }

}