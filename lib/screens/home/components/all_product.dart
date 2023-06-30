import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:shop_app/components/loader.dart';
import 'package:shop_app/components/nothing_to_show.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/size_config.dart';

class ProductsSection extends StatelessWidget {
  final String sectionTitle;
  final Future<List<Product>>? products;
  final String emptyListMessage;

  const ProductsSection({
    Key? key,
    required this.sectionTitle,
    required this.products,
    this.emptyListMessage = "No Products to show here",
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        color: Color(0xFFF5F6F9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenHeight(16)
            ),
            child: SectionTitle(
              title: sectionTitle,
              press: () {},
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          Expanded(
            child: buildProductsList(),
          ),
        ],
      ),
    );
  }

  Widget buildProductsList() {
    return FutureBuilder<List<Product>>(
      future: products,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.length == 0) {
            return Center(
              child: NothingToShowContainer(
                secondaryMessage: emptyListMessage,
              ),
            );
          }
          return buildProductGrid(snapshot.data!);
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Loader(),
          );
        } else if (snapshot.hasError) {
          final error = snapshot.error;
          log(error.toString());
        }
        return Center(
          child: NothingToShowContainer(
            iconPath: "assets/icons/network_error.svg",
            primaryMessage: "Something went wrong",
            secondaryMessage: "Unable to connect to Database",
          ),
        );
      },
    );
  }

  Widget buildProductGrid(List<Product> products) {
    return GridView.builder(
      padding: EdgeInsets.only(
        right: getProportionateScreenWidth(20)
      ),
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          heroTag: "allProds",
          product: products[index],
        );
      },
    );
  }
}
