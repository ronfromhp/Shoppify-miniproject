import 'package:flutter/material.dart';
import 'package:shop_app/auth_controller.dart';
import 'package:shop_app/utils/firestore.dart';

import '../../models/Cart.dart';
import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  const DetailsScreen({super.key});

  void addToCart (Cart cartItem) async{
   final cartItems = CartController.instance.cartItems;
   final existingCartItemIndex = cartItems.indexWhere((item) => item.product.id == cartItem.product.id);
    if (existingCartItemIndex != -1) {
      final existingCartItem = cartItems[existingCartItemIndex];
      cartItems[existingCartItemIndex] = Cart(
        product: existingCartItem.product,
        count: existingCartItem.count + cartItem.count,
      );
    } else {
      cartItems.add(cartItem);
    }
    await FirestoreUtil.addToCart(AuthController.instance.currentUser, cartItem.product.id);
  }

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: agrs.product.rating),
      ),
      body: Body(product: agrs.product, heroTag: agrs.heroTag, addToCartCallback: addToCart,),
    );
  }
}

class ProductDetailsArguments {
  final Product product;
  final String heroTag;
  ProductDetailsArguments({required this.product, required this.heroTag});
}
