import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatefulWidget {
  CartCard({
    Key? key,
    required this.cart,
    required this.updateCartCount,
  }) : super(key: key);

  Cart cart;
  Function(int) updateCartCount;
  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image(image : CachedNetworkImageProvider(widget.cart.product.images[0])),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex:  5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.cart.product.title,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "\$${widget.cart.product.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                  children: [
                    TextSpan(
                        text: " x${widget.cart.count}",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(width: 12),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 2,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: kTextColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.arrow_drop_up,
                      color: kTextColor,
                    ),
                    onTap: () async {
                      await arrowUpCallback();
                    },
                  ),
                  SizedBox(height: 8),
                  Text(
                        "${widget.cart.count}",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    
                  SizedBox(height: 8),
                  InkWell(
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: kTextColor,
                    ),
                    onTap: () async {
                      await arrowDownCallback();
                    },
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Future<void> arrowUpCallback() async {
      widget.updateCartCount(widget.cart.count+1);
  }

  Future<void> arrowDownCallback() async {
      widget.updateCartCount(widget.cart.count-1);
  }
}
