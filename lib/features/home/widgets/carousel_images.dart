import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImages extends StatelessWidget {
  final List carouselImages;
  final double height;
  const CarouselImages({
    super.key,
    required this.carouselImages,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: carouselImages.map((i) {
          return Builder(
              builder: (BuildContext context) => Image.network(
                    i,
                    width: MediaQuery.of(context).size.width,
                    height: height,
                    fit: BoxFit.cover,
                  ));
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 1,
          height: height,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayInterval:
              const Duration(seconds: 15), // Change image every 5 seconds
        ));
  }
}
