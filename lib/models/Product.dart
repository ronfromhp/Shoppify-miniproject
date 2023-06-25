import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
part 'Product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<int> colors;
  final List<List<String>> coloredImg;
  final double rating, price;
  final bool isFavourite, isPopular;

  String category;

  Product({
    required this.id,
    required this.images,
    this.colors = const [],
    this.coloredImg = const [],
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    this.category = '',
    required this.title,
    required this.price,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  
  Map<String, dynamic> toJson() => _$ProductToJson(this);

}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E).value,
      Color(0xFF836DB8).value,
      Color(0xFFDECB9C).value,
      Colors.white.value,
    ],
    coloredImg: [
      [
        "assets/images/ps4_console_white_1.png",
        "assets/images/ps4_console_white_2.png",
        "assets/images/ps4_console_white_3.png",
        "assets/images/ps4_console_white_4.png",
      ],
      [
        "assets/images/ps4_console_blue_1.png",
        "assets/images/ps4_console_blue_2.png",
        "assets/images/ps4_console_blue_3.png",
        "assets/images/ps4_console_blue_4.png",
      ]
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      Color(0xFFF6625E).value,
      Color(0xFF836DB8).value,
      Color(0xFFDECB9C).value,
      Colors.white.value,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      Color(0xFFF6625E).value,
      Color(0xFF836DB8).value,
      Color(0xFFDECB9C).value,
      Colors.white.value,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Color(0xFFF6625E).value,
      Color(0xFF836DB8).value,
      Color(0xFFDECB9C).value,
      Colors.white.value,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
