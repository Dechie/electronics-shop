import 'package:flutter/material.dart';
import 'package:mobile_shop/constants.dart';
import 'package:mobile_shop/models/mobile.dart';
import 'package:mobile_shop/widgets/custom_text.dart';

class SpecialMobileItem extends StatelessWidget {
  const SpecialMobileItem({
    Key? key,
    required this.mobile,
  });

  final Mobile mobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),
      width: 270,
      height: 135,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              'assets/images/iphone_14.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: CustomText(
              text: 'Iphone 14 pro',
              size: 20,
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 50,
            right: 50,
            child: CustomText(
              text: 'Storage 256',
              size: 16,
              color: mainRed,
            ),
          ),
        ],
      ),
    );
  }
}
