import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Stars extends StatelessWidget {
  final double rating;
  final double itemSize;
  const Stars({super.key, required this.rating, required this.itemSize});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      direction: Axis.horizontal,
      itemCount: 5,
      itemSize: itemSize,
      rating: rating,
      itemBuilder: (context, _) => Icon(
        Icons.star_rate,
        color: Colors.amber[400],
      ),
    );
  }
}
