import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/common/widgets/loading.dart';
import 'package:flutter_store_nodjs/features/details/screens/product_details_screen.dart';
import 'package:flutter_store_nodjs/features/home/services/home_services.dart';
import 'package:flutter_store_nodjs/features/home/widgets/product_card.dart';
import 'package:flutter_store_nodjs/models/product_model.dart';

class HomeCategoryScreen extends StatefulWidget {
  static const String routeName = '/home-category-screen';
  final String category;
  const HomeCategoryScreen({super.key, required this.category});

  @override
  State<HomeCategoryScreen> createState() => _HomeCategoryScreenState();
}

class _HomeCategoryScreenState extends State<HomeCategoryScreen> {
  HomeServices homeServices = HomeServices();
  List<ProductModel>? productsList;
  @override
  void initState() {
    fetchCategoryProducts();
    super.initState();
  }

  void fetchCategoryProducts() async {
    List<ProductModel>? products =
        await homeServices.getCategoryProducts(context, widget.category);
    productsList = products;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.category} Category"),
      ),
      body: productsList == null
          ? const Loading()
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SizedBox(
                height: 200,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // You can change the number of columns
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: productsList!
                      .length, // Replace with your actual list of products
                  itemBuilder: (context, index) {
                    var product = productsList![index];
                    return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ProductDetailsScreen.routeName,
                              arguments: product);
                        },
                        child: ProductCard(product: product));
                  },
                ),
              ),
            ),
    );
  }
}
