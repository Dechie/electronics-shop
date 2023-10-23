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
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
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
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(5)),
                    color: myOrange,
                  ),
                  alignment: Alignment.center,
                  width: 85,
                  height: 20,
                  child: CustomText(
                      text: '${mobile.price} ETB', color: Colors.white),
                ),
              ),
            ],
          ),
          CustomText(
            text: mobile.title,
            size: 16,
            color: mainRed,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll<Color>(mainRed),
                  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  ),
                ),
                onPressed: () {},
                child: const Row(
                  children: [Icon(Icons.info), Text('Info')],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll<Color>(mainRed),
                  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  ),
                ),
                onPressed: () {},
                child: const Row(
                  children: [Icon(Icons.shopping_cart), Text('Cart')],
                ),
              )
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
