import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_shop/screens/detail%20screen/detail_screen.dart';
import 'package:mobile_shop/utils/constants.dart';
import 'package:mobile_shop/utils/method_utils.dart';
import 'package:mobile_shop/widgets/custom_text.dart';

import '../models/laptop.dart';
import '../services/providers/all_favorites.dart';

class ElementaryLaptopItem extends ConsumerStatefulWidget {
  final Laptop laptop;

  final void Function() changeIconData;

  final bool isFavorite;
  const ElementaryLaptopItem({
    super.key,
    required this.laptop,
    required this.changeIconData,
    required this.isFavorite,
  });

  @override
  ConsumerState<ElementaryLaptopItem> createState() =>
      _ElementaryLaptopItemState();
}

class _ElementaryLaptopItemState extends ConsumerState<ElementaryLaptopItem> {
  bool wasItAdded = false;

  @override
  Widget build(BuildContext context) {
    var priceStr = widget.laptop.price.round().toString();
    priceStr = '${priceStr.substring(0, 2)},${priceStr.substring(2)}';

    return GestureDetector(
      onTap: () {
        // final wasAdded =
        //     ref.read(cartItemsProvider.notifier).addItemToCart(widget.laptop);
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
          DetailScreen(product: widget.laptop),
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: 148,
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
                      'assets/images/${widget.laptop.image}',
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
                                .toggleItemFavorite(widget.laptop);

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
                  text: widget.laptop.title,
                  size: Theme.of(context).textTheme.titleSmall!.fontSize,
                  color: mainredBlacked,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Row(
                  children: [
                    CustomText(
                      //text: '${laptop.price} ETB',
                      text: '$priceStr ETB',
                      color: mainredBlacked,
                    ),
                    const Spacer(),
                    // FilledButton.icon(
                    //   style: const ButtonStyle(
                    //     backgroundColor: WidgetStatePropertyAll<Color>(mainRed),
                    //     foregroundColor:
                    //         WidgetStatePropertyAll<Color>(Colors.white),
                    //   ),
                    //   onPressed: () {},
                    //   label: const Text('Cart'),
                    //   icon: const Icon(
                    //     Icons.shopping_cart_checkout_outlined,
                    //     color: Colors.white,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
