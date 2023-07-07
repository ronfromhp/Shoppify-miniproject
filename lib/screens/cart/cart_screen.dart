import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/models/Cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  final itemCount = CartController.instance.cartItems.length;

  CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
      bottomNavigationBar: const CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Obx(() {
            final itemCount = CartController.instance.cartItems.length;
            return Text(
              "$itemCount items",
              style: Theme.of(context).textTheme.bodySmall,
            );
          }),
        ],
      ),
    );
  }
}
