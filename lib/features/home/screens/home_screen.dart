// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/features/home/services/home_services.dart';
import 'package:flutter_store_nodjs/features/home/widgets/carousel_images.dart';
import 'package:flutter_store_nodjs/features/home/widgets/address_box.dart';
import '../../../components/myconstans.dart';
import '../../../models/product_model.dart';
import '../widgets/products_listview_builder.dart';
import '../widgets/home_categories.dart';
import '../widgets/my_search_appbar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeServices homeServices = HomeServices();
  ProductModel productModel = ProductModel();
  List<ProductModel>? productsList;
  List<ProductModel>? productsDiscountList;

  getAllProducts() async {
    List<ProductModel>? fetchedProducts =
        await homeServices.getAllProducts(context);
    productsList = fetchedProducts;
    setState(() {});
  }

  getDescountsProducts() async {
    List<ProductModel>? fetchedProducts =
        await homeServices.getDescountsProducts(context);
    productsDiscountList = fetchedProducts;
    setState(() {});
  }

  @override
  void initState() {
    getAllProducts();
    getDescountsProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<UserProvider>(context).user;
    double myHeight = MediaQuery.of(context).size.height; //887
    //double myWidth = MediaQuery.of(context).size.width; // 410
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MySearchAppBar(),
            InkWell(
              onTap: () {
                debugPrint('screen height is: $myHeight');
              },
              child: const AddressBox(),
            ),
            SizedBox(
              height: myHeight / 3,
              child: Stack(
                children: [
                  CarouselImages(
                    carouselImages: MyConstans.carouselImages,
                    height: myHeight / 3,
                  ),
                  const Positioned(
                    //top: 20,
                    child: HomeCategories(),
                  ),
                ],
              ),
            ),

            ProductsListViewBuilder(
                productsList: productsDiscountList, text: 'Best Discounts'),
            ProductsListViewBuilder(
                productsList: productsList, text: 'All Products'),
            // InkWell(
            //     onTap: () {
            //       print(myWidth);
            //     },
            //     child: Text('myWidth'))
            //DealOfTheDay(),
            //Text(user.toJson()),
          ],
        ),
      ),
    );
  }
}
