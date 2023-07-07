import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'Product.dart';
part 'Cart.g.dart';

@JsonSerializable()
class Cart {
  final Product product;
  final int count;

  Cart({required this.product, required this.count});

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  static double getCartTotal(List<Cart> carts) {
    double total = 0;
    for (Cart cart in carts) {
      total += cart.product.price * cart.count;
    }
    return total;
  }
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: demoProducts[0], count: 2),
  Cart(product: demoProducts[1], count: 1),
  Cart(product: demoProducts[3], count: 1),
];

class CartController extends GetxController {

  static CartController get instance => Get.find<CartController>();
  // Define an observable list of Cart objects
  var cartItems = <Cart>[].obs;

  // Add a cart item to the list
  void addToCart(Cart cart) {
    cartItems.add(cart);
  }

  // Remove a cart item from the list
  void removeFromCart(Cart cart) {
    cartItems.remove(cart);
  }
}