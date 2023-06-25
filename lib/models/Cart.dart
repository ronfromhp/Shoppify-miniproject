import 'package:json_annotation/json_annotation.dart';
import 'Product.dart';

@JsonSerializable()
class Cart {
  final Product product;
  final int count;

  Cart({required this.product, required this.count});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: demoProducts[0], count: 2),
  Cart(product: demoProducts[1], count: 1),
  Cart(product: demoProducts[3], count: 1),
];
