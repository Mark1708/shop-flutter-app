import 'package:flutter/material.dart';
import 'package:shop_app/model/category_model.dart';
import 'package:shop_app/service/category_service.dart';
import '../../../size_config.dart';

class Categories extends StatelessWidget {

  final CategoryService httpService = CategoryService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: httpService.getAll(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List<Category>? categories = snapshot.data;
            return Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: categories!.map(
                        (Category category) => CategoryCard(
                          icon: category.imageUrl,
                          text: category.name,
                          press: () {},
                        ),
                ).toList(),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(60),
              decoration: BoxDecoration(
                color: Color(0xFFDFECFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center, style: TextStyle(fontSize: 9),)
          ],
        ),
      ),
    );
  }
}
