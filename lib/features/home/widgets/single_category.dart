
import 'package:flutter/material.dart';

class SingleCategory extends StatelessWidget {
  final String name;
  final String image;
  const SingleCategory({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      //color: Colors.deepOrangeAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontSize: 18),
          ),
          //SizedBox(height: 5),
          SizedBox(
              height: 60,
              width: 60,
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ))
        ],
      ),
    );
  }
}
