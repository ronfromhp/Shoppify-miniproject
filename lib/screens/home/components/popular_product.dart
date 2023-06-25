import 'package:flutter/material.dart';
import 'package:shop_app/components/loader.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/utils/firestore.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatefulWidget {
  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {

  Future<List<Product>>? products;
  @override
  void initState(){
    super.initState();
    products = FirestoreUtil.getProducts([]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: products,
      builder: (context,
        AsyncSnapshot<List<Product>> snapshot) {
          if(snapshot.hasData && snapshot.data != null) {
            return Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                  child: SectionTitle(title: "Popular Products", press: () {}),
                ),
                SizedBox(height: getProportionateScreenWidth(20)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        snapshot.data!.length,
                        (index) {
                          if (snapshot.data![index].isPopular)
                            return ProductCard(product: snapshot.data![index]);

                          return SizedBox.shrink(); // here by default width and height is 0
                        },
                      ),
                      SizedBox(width: getProportionateScreenWidth(20)),
                    ],
                  ),
                )
              ],
            );
          }
          else {
            return const Center(child: Loader());
          }
        }
    );
  }
}
