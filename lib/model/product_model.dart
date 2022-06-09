import 'dart:math';

import 'package:flutter/foundation.dart';

class Product {
  final int id;
  final int categoryId;
  final String name;
  final String description;
  final int count;
  final double price;
  final List<String> imageUrls;


  Product({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.count,
    required this.price,
    required this.imageUrls
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      categoryId: json['categoryId'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      count: json['count'] as int,
      price: json['price'] as double,
      imageUrls: List.from(json['imageUrls']),
    );
  }

  bool isFavourite(){
    Random r = new Random();
    return r.nextDouble() <= 0.3;
  }
}