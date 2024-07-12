import 'package:flutter/material.dart';
import 'package:mobile_shop/utils/constants.dart';
import 'package:mobile_shop/widgets/custom_text.dart';

import '../models/mobile.dart';

class ElementaryMobileItem extends StatelessWidget {
  final Mobile mobile;

  const ElementaryMobileItem({
    super.key,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showAboutDialog(
          context: context,
          children: [
            const Text('overall widget selected'),
          ],
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
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
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: SizedBox(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite_border_outlined,
                            color: mainRed,
                          ),
                          onPressed: () {
                            showAboutDialog(
                              context: context,
                              children: [
                                const Text('favorite button touched'),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: mobile.title,
                  size: 16,
                  color: mainRed,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    CustomText(
                      text: '${mobile.price} ETB',
                      color: mainRed,
                    ),
                    const Spacer(),
                    // FilledButton.icon(
                    //   style: const ButtonStyle(
                    //     backgroundColor: WidgetStatePropertyAll<Color>(mainRed),
                    //     foregroundColor:
                    //         WidgetStatePropertyAll<Color>(Colors.white),
                    //   ),
                    //   onPressed: () {
                    //     showAboutDialog(
                    //       context: context,
                    //       children: [
                    //         const Text('cart button touched'),
                    //       ],
                    //     );
                    //   },
                    //   label: const Text('Cart'),
                    //   icon: const Icon(
                    //     Icons.shopping_cart_checkout_outlined,
                    //     color: Colors.white,
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
