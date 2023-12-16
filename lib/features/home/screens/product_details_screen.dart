import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/components/myconstans.dart';
import 'package:flutter_store_nodjs/features/home/widgets/carousel_images.dart';
import 'package:gap/gap.dart';
import '../../../models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  static const String routeName = "/product-details-screen";

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              //            CarouselImages(product.images!),
              CarouselSlider(
                  items: product.images!.map((i) {
                    return Builder(
                        builder: (BuildContext context) => Image.network(
                              i,
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              fit: BoxFit.cover,
                            ));
                  }).toList(),
                  options: CarouselOptions(viewportFraction: 1, height: 200)),

              // Container(
              //   height: 300,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: NetworkImage(product.images?.first ?? ''),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),

              // Product Name and Price

              Padding(
                //width: width / 1.5,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  product.name ?? 'No Name',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: MyConstans.lightBlueSecondary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Text(
                      'PRICE:',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: MyConstans.text,
                      ),
                    ),
                    const Gap(10),
                    Text(
                      '\$${product.price ?? 0}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: MyConstans.success,
                      ),
                    ),
                    const Gap(10),
                    const Text(
                      '-15%',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: MyConstans.redColorMain,
                      ),
                    ),
                  ],
                ),
              ),

              // Product Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  product.description ?? 'No Description',
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 16),
                ),
              ),

              // Buttons Section
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //width: 600,
                //color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          // Handle Add to Cart button press
                        },
                        /* style: ElevatedButton.styleFrom(
                          backgroundColor: MyConstans.textLight,
                        ), */
                        icon: const Icon(
                          Icons.add_shopping_cart_outlined,
                          color: MyConstans.lightBlueSecondary,
                          size: 30,
                        )),
                    const Gap(10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Buy Now button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyConstans.redColorMain,
                        ),
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
