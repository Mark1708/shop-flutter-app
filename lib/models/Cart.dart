import 'package:shop_app/model/product_model.dart';
import 'package:shop_app/service/cart_service.dart';


class Cart {
  final CartService _httpService = new CartService();
  final Product product;
  final int numOfItem;

  Cart({required this.product, required this.numOfItem});
}

// Demo data for our cart
