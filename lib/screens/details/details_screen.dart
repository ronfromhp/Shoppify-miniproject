import 'package:flutter/material.dart';

import '../../models/Cart.dart';
import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  void addToCart(Cart cartItem){
   final existingCartItemIndex = demoCarts.indexWhere((item) => item.product.id == cartItem.product.id);
    if (existingCartItemIndex != -1) {
      final existingCartItem = demoCarts[existingCartItemIndex];
      demoCarts[existingCartItemIndex] = Cart(
        product: existingCartItem.product,
        count: existingCartItem.count + cartItem.count,
      );
    } else {
      demoCarts.add(cartItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
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
