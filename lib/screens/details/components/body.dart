import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/size_config.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;
  final String heroTag;
  final Function(Cart) addToCartCallback; // Callback function

  const Body({Key? key, required this.product,required this.heroTag, required this.addToCartCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product, heroTag:  heroTag,),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                
              ),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {
                            addToCartCallback(
                              Cart(
                                product: product,
                                count: 1
                                )
                              ); // Call the callback function with the product
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
