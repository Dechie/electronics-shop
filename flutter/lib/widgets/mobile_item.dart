import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_shop/services/providers/mobile_favorites.dart';
import 'package:mobile_shop/utils/constants.dart';
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
                          icon: Icon(
                            widget.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: mainRed,
                          ),
                          onPressed: () {
                            final wasAdded = ref
                                .read(mobileFavProvider.notifier)
                                .toggleMobileFavorite(widget.mobile);
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  wasAdded ? 'Added' : 'Removed',
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
                  size: 16,
                  color: mainRed,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    CustomText(
                      text: '${widget.mobile.price} ETB',
                      color: mainRed,
                    ),
                    const Spacer(),
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
