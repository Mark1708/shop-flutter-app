import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/model/product_model.dart';
import 'package:shop_app/service/product_service.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {

  final ProductService httpService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        FutureBuilder(
            future: httpService.getPopular(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                List<Product>? products = snapshot.data;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: products!.map(
                            (Product product) => ProductCard(product: product),
                        // SizedBox(width: getProportionateScreenWidth(20))
                      ).toList(),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }
            // child: Row(
            //   children: [
            //     ...List.generate(
            //       demoProducts.length,
            //       (index) {
            //         if (demoProducts[index].isPopular)
            //           return ProductCard(product: demoProducts[index]);
            //
            //         return SizedBox
            //             .shrink(); // here by default width and height is 0
            //       },
            //     ),
            //     SizedBox(width: getProportionateScreenWidth(20)),
            //   ],
            // ),
            )
      ],
    );
  }
}
