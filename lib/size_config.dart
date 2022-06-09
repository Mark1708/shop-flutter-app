import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  // Получаем характеристики устройства
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Получить пропорциональную высоту в соответствии с размером экрана
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 - высота макета, которую использует дизайнер
  return (inputHeight / 812.0) * screenHeight;
}

// Получить пропорциональную ширину в соответствии с размером экрана
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 - ширина макета, которую использует дизайнер
  return (inputWidth / 375.0) * screenWidth;
}