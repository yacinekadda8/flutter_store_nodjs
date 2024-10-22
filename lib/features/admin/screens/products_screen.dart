import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/features/admin/screens/add_product_screen.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/loading.dart';
import '../../../components/utils.dart';
import '../../../models/product_model.dart';
import '../providers/products_provider.dart';
import '../services/admin_services.dart';
import '../widgets/product_card.dart';

class AdminProductsScreen extends StatefulWidget {
  const AdminProductsScreen({super.key});

  @override
  State<AdminProductsScreen> createState() => _AdminProductsScreenState();
}

class _AdminProductsScreenState extends State<AdminProductsScreen> {
  List<ProductModel>? products;
  AdminServices adminServices = AdminServices();

  @override
  void initState() {
    // This is where the products are fetched
    getProductsInvok();
    super.initState();
  }

  getProductsInvok() async {
    List<ProductModel>? fetchedProducts =
        await adminServices.getAllProducts(context);
    products = fetchedProducts;
    setState(() {});
  }

  // void deleteProduct(ProductModel product, int index) {
  //   adminServices.deleteProduct(
  //     context: context,
  //     product: product,
  //     onSuccess: () {
  //       products!.removeAt(index);
  //       setState(() {});
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    //final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: products == null
          ? const Loading()
          : products!.isEmpty
              ? const Center(
                  child: Text('No products available.'),
                )
              : SizedBox(
                  child: ListView.builder(
                    itemCount: products!.length,
                    itemBuilder: (context, index) {
                      final product = products![index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10, top: 10),
                        child: ProductCard(
                          productName: product.name ?? 'unkown',
                          productDescription: product.description ?? "dskfjs",
                          productPrice: product.price ?? 33,
                          imageUrl: product.images![0],
                          onDeletePressed: () {
                            productProvider
                                .deleteProduct(product, index, context, () {
                              products!.removeAt(index);
                              setState(() {});
                              showSnackBar(
                                  context, 'Product Deleted successfuly!');
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AddProductScreen.routeName,
          );
        },
        tooltip: 'Add a new product',
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}
