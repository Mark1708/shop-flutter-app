import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/service/cart_service.dart';
import 'package:shop_app/service/category_service.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final CartService httpService = new CartService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: httpService.getCart(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List<Cart>? carts = snapshot.data;
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: ListView(
                  children: carts!.map(
                          (Cart cart) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Dismissible(
                                key: Key(cart.product.id.toString()),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              setState(() {
                                carts.remove(cart);
                              });
                            },
                            background: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: Color(0xFFE6E7FF),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Spacer(),
                                  SvgPicture.asset("assets/icons/Trash.svg"),
                                ],
                              ),
                            ),
                            child: CartCard(cart: cart),
                          ),
                  ),
                  ).toList(),
                )
            );
          }else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      );
    // return Padding(
    //   padding:
    //       EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
    //   child: ListView.builder(
    //     itemCount: 5,
    //     itemBuilder: (context, index) => Padding(
    //       padding: EdgeInsets.symmetric(vertical: 10),
    //       child: Dismissible(
    //         key: Key(carts.[index].product.id.toString()),
    //         direction: DismissDirection.endToStart,
    //         onDismissed: (direction) {
    //           setState(() {
    //             demoCarts.removeAt(index);
    //           });
    //         },
    //         background: Container(
    //           padding: EdgeInsets.symmetric(horizontal: 20),
    //           decoration: BoxDecoration(
    //             color: Color(0xFFE6E7FF),
    //             borderRadius: BorderRadius.circular(15),
    //           ),
    //           child: Row(
    //             children: [
    //               Spacer(),
    //               SvgPicture.asset("assets/icons/Trash.svg"),
    //             ],
    //           ),
    //         ),
    //         child: CartCard(cart: demoCarts[index]),
    //       ),
    //     ),
    //   ),
    // );
  }
}
