import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_store_nodjs/common/widgets/loading.dart';
import 'package:flutter_store_nodjs/common/widgets/stars.dart';
import 'package:flutter_store_nodjs/components/myconstans.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';
import '../../../models/product_model.dart';
import '../../home/widgets/products_listview_builder.dart';
import '../details_services.dart';
import '../widgets/payment_bottom_sheet.dart';
import '../../home/widgets/carousel_images.dart';
import '../../home/widgets/costum_btn.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  static const String routeName = "/product-details-screen";

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final DetailsServices detailsServices = DetailsServices();
  List<ProductModel>? productsSimilarList;
  void getProductsInvok() async {
    List<ProductModel>? fetchedSimilarProducts;
    fetchedSimilarProducts =
        await detailsServices.getSimilarProducts(context, widget.product.id!);
    productsSimilarList = fetchedSimilarProducts;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getProductsInvok();
  }

  @override
  Widget build(BuildContext context) {
    //final homeProvider = Provider.of<HomeProvider>(context);
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
              CarouselImages(
                carouselImages: widget.product.images!,
                height: 350,
              ),
              // Product Name and Price
              Padding(
                //width: width / 1.5,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.product.name ?? 'No Name',
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
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: MyConstans.text,
                      ),
                    ),
                    const Gap(10),
                    Text(
                      '\$${widget.product.price ?? 0}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: MyConstans.success,
                      ),
                    ),
                    const Gap(10),
                    widget.product.discount != null
                        ? Text(
                            '-${widget.product.discount ?? 0}%',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: MyConstans.redColorMain,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              const Padding(
                //width: width / 1.5,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      '4.5',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(10),
                    Stars(rating: 4.5, itemSize: 30),
                    Gap(10),
                    Text(
                      '1350',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: MyConstans.lightBlueSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              // Product Description
              InkWell(
                onTap: () {
                  // open Full Description
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ReadMoreText(
                    "${widget.product.description} ",
                    trimLines: 5,
                    colorClickableText: MyConstans.lightBlueSecondary,
                    trimMode: TrimMode.Line,
                    textAlign: TextAlign.justify,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: MyConstans.lightBlueSecondary),
                    lessStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: MyConstans.redColorMain),
                  ),
                  // Text(
                  //   widget.product.description ?? 'No Description',
                  //   softWrap: true,
                  //   maxLines: 6,
                  //   overflow: TextOverflow.ellipsis,
                  //   textAlign: TextAlign.justify,
                  //   style: const TextStyle(fontSize: 16),
                  // ),
                ),
              ),
              const Gap(20),

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
                        child: CusstomBtn(
                            text: 'Buy Now',
                            onPressed: () {
                              // Handle Buy Now button press
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return PaymentBottomSheet(
                                    productName: widget.product.name!,
                                    totalPrice: widget.product.price!,
                                  );
                                },
                              );
                            },
                            color: MyConstans.redColorMain)),
                  ],
                ),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    const Text(
                      'Rate the product: ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: MyConstans.text,
                      ),
                    ),
                    RatingBar.builder(
                        maxRating: 1,
                        allowHalfRating: true,
                        itemSize: 30,
                        itemCount: 5,
                        initialRating: 1,
                        itemBuilder: (context, _) =>
                            Icon(Icons.star, color: Colors.amber[400]),
                        onRatingUpdate: (rating) {}),
                  ],
                ),
              ),
              productsSimilarList == null
                  ? const Loading()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        productsSimilarList!.isEmpty
                            ? const Text(
                                "No Similar Poducts",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: MyConstans.lightBlueSecondary,
                                ),
                              )
                            : ProductsListViewBuilder(
                                productsList: productsSimilarList,
                                text: "Similar Poducts",
                              ),
                        /* SizedBox(
                        height: 200,
                        // Adjust the height as needed
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productsSimilarList != null
                              ? productsSimilarList!.length
                              : 0,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            ProductModel product =
                                productsSimilarList![index];
                            return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context,
                                      ProductDetailsScreen.routeName,
                                      arguments: product);
                                },
                                child: ProductCard(
                                    product: productsSimilarList![index]));
                          },
                        ),
                      ) */
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
