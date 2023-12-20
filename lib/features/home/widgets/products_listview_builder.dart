import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/components/myconstans.dart';
import 'package:flutter_store_nodjs/features/details/screens/product_details_screen.dart';
import 'package:flutter_store_nodjs/features/home/widgets/product_card.dart';
import 'package:flutter_store_nodjs/models/product_model.dart';

class ProductsListViewBuilder extends StatelessWidget {
  const ProductsListViewBuilder({
    super.key,
    required this.productsList,
    required this.text,
  });

  final List<ProductModel>? productsList;
  final String text;

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width; // 410

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text(
            text,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: MyConstans.lightBlueSecondary,
            ) 
          ),
          SizedBox(
            height: myWidth / 1.9,
            // Adjust the height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productsList != null ? productsList!.length : 0,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                ProductModel product = productsList![index];
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ProductDetailsScreen.routeName,
                          arguments: product);
                    },
                    child: ProductCard(product: productsList![index]));
              },
            ),
          )
        ],
      ),
    );
  }
}
