import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/home/components/all_product.dart';
import 'package:shop_app/utils/firestore.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  Future<List<Product>>? products;
  @override
  void initState() {
    super.initState();
    products = FirestoreUtil.getProducts([]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            const HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            const DiscountBanner(),
            const Categories(),
            const SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(
              products: products,
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            SizedBox(
              height: SizeConfig.screenHeight * 0.85,
              child: ProductsSection(
                sectionTitle: "Explore All Products",
                products: products,
                emptyListMessage: "Looks like all Stores are closed",
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
