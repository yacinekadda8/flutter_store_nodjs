import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/common/widgets/stars.dart';
import '../../../models/product_model.dart';

class ProductCardHorizontal extends StatelessWidget {
  final ProductModel product;

  const ProductCardHorizontal({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180, // Adjust the height as needed
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              width: 150, // Adjust the width as needed
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.images?.first ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Product Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name ?? 'No Name',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Stars(rating: 4, itemSize: 20),
                    Text(
                      'Price: \$${product.price ?? 0}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Category: ${product.category ?? 'No Category'}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    product.quantity! > 0
                        ? const Text(
                            'In Stock',
                            style: TextStyle(
                                fontSize: 14, color: Colors.green),
                          )
                        : const Text(
                            'Out of Stock',
                            style: TextStyle(
                                fontSize: 14, color: Colors.red),
                          ),
                    product.quantity! > 0
                        ? const Text(
                            'Free Shipping',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
