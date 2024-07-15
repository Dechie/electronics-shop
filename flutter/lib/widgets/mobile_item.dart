import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_shop/screens/detail%20screen/detail_screen.dart';
import 'package:mobile_shop/services/providers/all_favorites.dart';
import 'package:mobile_shop/utils/constants.dart';
import 'package:mobile_shop/utils/method_utils.dart';
import 'package:mobile_shop/widgets/custom_text.dart';

import '../models/mobile.dart';

class ElementaryMobileItem extends ConsumerStatefulWidget {
  final Mobile mobile;

  final bool isFavorite;

  final void Function() changeIconData;
  const ElementaryMobileItem({
    super.key,
    required this.mobile,
    required this.changeIconData,
    required this.isFavorite,
  });

  @override
  ConsumerState<ElementaryMobileItem> createState() =>
      _ElementaryMobileItemState();
}

class _ElementaryMobileItemState extends ConsumerState<ElementaryMobileItem> {
  @override
  Widget build(BuildContext context) {
    var priceStr = widget.mobile.price.round().toString();
    priceStr = '${priceStr.substring(0, 2)},${priceStr.substring(2)}';
    return GestureDetector(
      onTap: () {
        // final wasAdded =
        //     ref.read(cartItemsProvider.notifier).addItemToCart(widget.mobile);
        // ScaffoldMessenger.of(context).clearSnackBars();
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text(
        //       wasAdded ? 'Successully added to cart' : 'Removed From cart',
        //     ),
        //   ),
        // );
        navigate(
          context,
          DetailScreen(product: widget.mobile),
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: 148,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
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
                      height: 148,
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
                          icon: Icon(
                            widget.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: mainRed,
                          ),
                          onPressed: () {
                            final wasAdded = ref
                                .read(allFavProvider.notifier)
                                .toggleItemFavorite(widget.mobile);
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  wasAdded
                                      ? 'Successully added to favorites'
                                      : 'Removed From favorites',
                                ),
                              ),
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
                  text: widget.mobile.title,
                  size: Theme.of(context).textTheme.titleSmall!.fontSize,
                  color: mainredBlacked,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    CustomText(
                      text: '$priceStr ETB',
                      color: mainredBlacked,
                    ),
                    // FilledButton.icon(
                    //   style: const ButtonStyle(
                    //     backgroundColor: WidgetConsumerStatePropertyAll<Color>(mainRed),
                    //     foregroundColor:
                    //         WidgetConsumerStatePropertyAll<Color>(Colors.white),
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
