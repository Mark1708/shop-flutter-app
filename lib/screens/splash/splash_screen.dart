import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

import 'components/body.dart';

// Приветсвенный экран с каруселью
class SplashScreen extends StatelessWidget {
  // const SplashScreen({Key? key}) : super(key: key);
  // Адрес экрана
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
