// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/features/home/services/home_services.dart';
import 'package:flutter_store_nodjs/features/home/widgets/carousel_images.dart';
import 'package:flutter_store_nodjs/features/home/widgets/address_box.dart';
import '../../../components/myconstans.dart';
import '../../../models/product_model.dart';
import '../widgets/all_products.dart';
import '../widgets/home_categories.dart';
import '../widgets/myhome_appbar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeServices homeServices = HomeServices();
  List<ProductModel>? productsList;
  getProductsInvok() async {
    List<ProductModel>? fetchedProducts =
        await homeServices.getAllProducts(context);
    productsList = fetchedProducts;
    setState(() {});
  }

  @override
  void initState() {
    getProductsInvok();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyHomeAppBar(),
            const AddressBox(),
            const CarouselImages(),
            // Image.network(
            //   "https://images.unsplash.com/photo-1701932521067-ab10be5e9e2a?q=80&w=1335&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            //   width: MediaQuery.of(context).size.width,
            //   height: 200,
            //   fit: BoxFit.cover,
            // ),
            const HomeCategories(),
            //Text(user.toJson()),
            AllProducts(productsList: productsList),
            //DealOfTheDay(),
          ],
        ),
      ),
    );
  }
}


class DealOfTheDay extends StatelessWidget {
  const DealOfTheDay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyConstans.surface,
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://m.media-amazon.com/images/W/MEDIAX_792452-T1/images/I/81Svdy-MGbL._AC_SX425_.jpg',
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width / 2.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: const Text(
                    'Acer Swift Go Intel Evo Thin & Light Premium',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'PRICE: 999\$',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'OLd PRICE: 1799\$',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Container(
                  color: MyConstans.redColorMain,
                  width: 80,
                  child: const Text(
                    'Deal -28%',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                const Row(
                  children: [
                    Text(
                      "4.7",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.star, color: Colors.orangeAccent)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
