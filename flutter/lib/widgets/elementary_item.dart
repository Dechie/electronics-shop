import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_shop/constants.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_shop/widgets/custom_text.dart';
import '../models/mobile.dart';

class ElementaryMobileItem extends StatelessWidget {
  ElementaryMobileItem({Key? key, required this.mobile}) : super(key: key);

  final Mobile mobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width: 180,
      height: 260,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              'assets/images/s8.jpg',
              width: 170,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          CustomText(
            text: mobile.title,
            size: 16,
            color: mainRed,
          ),
          RowText(
            leftText: 'camera',
            rightText: '${mobile.cameraFront} by ${mobile.cameraBack}',
          ),
          RowText(
            leftText: 'storage',
            rightText: '${mobile.storage} by ${mobile.ram}',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: myOrange,
                width: 85,
                height: 15,
                child: CustomText(
                    text: '${mobile.price} ETB', color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('add to cart')));
                },
                child: const Icon(
                  Icons.shopping_cart,
                  color: mainRed,
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
