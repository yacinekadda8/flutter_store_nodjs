// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/features/home/widgets/carousel_images.dart';
import 'package:provider/provider.dart';

import 'package:flutter_store_nodjs/features/home/widgets/address_box.dart';
import 'package:flutter_store_nodjs/providers/user_provider.dart';

import '../../../components/constans.dart';
import '../widgets/home_categories.dart';
import '../widgets/myhome_appbar.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return SingleChildScrollView(
      child: Column(
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
          const Text(
            'Todays daily deals',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: MyConstans.surface,
            height: 200,
            child: Row(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Image.network(
                    'https://m.media-amazon.com/images/W/MEDIAX_792452-T1/images/I/81Svdy-MGbL._AC_SX425_.jpg',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
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
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'OLd PRICE: 1799\$',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          color: MyConstans.brandColor,
                          child: const Text(
                            'Deal -28%',
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
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.star, color: Colors.orangeAccent)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
