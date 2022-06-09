import 'package:flutter/material.dart';
import 'package:shop_app/routs.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // отключаем debug мод
      debugShowCheckedModeBanner: false,
      title: 'ITMO Store',
      // устанавливаем тему
      theme: theme(),
      // home: SplashScreen(),
      // подключаем маршрутизацию
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
