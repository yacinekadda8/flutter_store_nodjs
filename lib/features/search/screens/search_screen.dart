import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/common/widgets/loading.dart';
import 'package:flutter_store_nodjs/features/details/screens/product_details_screen.dart';

import '../../../models/product_model.dart';
import '../services/search_services.dart';
import '../widgets/product_card_horizantal.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "/search-screen";
  const SearchScreen({Key? key, required this.searchQuery}) : super(key: key);
  final String searchQuery;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<ProductModel>? searchProductsList;
  final SearchServices searchServices = SearchServices();

  void fetchSearchProductsList() async {
    List<ProductModel>? products =
        await searchServices.getCategoryProducts(context, widget.searchQuery);
    searchProductsList = products;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchSearchProductsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchProductsList != null
            ? Text("Search results for: ${widget.searchQuery.toUpperCase()}")
            : const Text("No results"),
      ),
      body: searchProductsList != null
          ? searchProductsList!.isEmpty
              ? const Center(child: Text('No products found'))
              : ListView.builder(
                  itemCount: searchProductsList!.length,
                  itemBuilder: (context, index) {
                    ProductModel product = searchProductsList![index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ProductDetailsScreen.routeName,
                          arguments: product,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductCardHorizontal(product: product),
                      ),
                    );
                  },
                )
          : widget.searchQuery.isEmpty
              ? const Center(child: Text('Empty query!'))
              : const Loading(),
    );
  }
}
