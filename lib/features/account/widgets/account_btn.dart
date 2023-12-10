// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/components/constans.dart';

class AccountBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const AccountBtn({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        //margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.0),
          borderRadius: BorderRadius.circular(50),
          //color: Colors.white,
        ),
        child: OutlinedButton(
            onPressed: () {},
            child: Text(
              text,
              style: const TextStyle(
                color: MyConstans.text,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            )),
      ),
    );
  }
}
