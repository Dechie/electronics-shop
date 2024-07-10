import 'package:flutter/material.dart';
import 'package:mobile_shop/constants.dart';
import 'package:mobile_shop/widgets/custom_text.dart';

import '../models/laptop.dart';

class ElementaryLaptopItem extends StatelessWidget {
  final Laptop laptop;

  const ElementaryLaptopItem({
    Key? key,
    required this.laptop,
  }) : super(key: key);

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
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(5)),
                    color: myOrange,
                  ),
                  alignment: Alignment.center,
                  width: 85,
                  height: 20,
                  child: CustomText(
                      text: '${laptop.price} ETB', color: Colors.white),
                ),
              ),
            ],
          ),
          CustomText(
            text: laptop.title,
            size: 16,
            color: mainRed,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll<Color>(mainRed),
                  shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
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
                  backgroundColor: const WidgetStatePropertyAll<Color>(mainRed),
                  shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
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
