import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Cart.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Cart> cartItems = CartController.instance.cartItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(cartItems[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                cartItems.removeAt(index);
              });
            },
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: CartCard(
              cart: cartItems[index],
              updateCartCount: (newCount) {
                setState(() {
                  if(newCount == 0){
                    cartItems.removeAt(index);
                    return;
                  }
                  cartItems[index] = Cart(product: cartItems[index].product, count: newCount);
                });
              }
            ),
          ),
        ),
      ),
    );
  }
}
