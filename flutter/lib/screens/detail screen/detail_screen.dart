import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_shop/models/laptop.dart';
import 'package:mobile_shop/screens/cart_screen.dart';
import 'package:mobile_shop/services/providers/cart_items.dart';
import 'package:mobile_shop/utils/method_utils.dart';
import 'package:mobile_shop/widgets/specs_list.dart';

import '../../models/mobile.dart';

class DetailScreen extends ConsumerStatefulWidget {
  final dynamic product;

  const DetailScreen({
    super.key,
    required this.product,
  });

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  bool isAddedToCart = false;
  Map<String, dynamic> specs = {};
  var product;
  DraggableScrollableController sheetController =
      DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    List cartItems = ref.watch(cartItemsProvider);
    isAddedToCart = cartItems.contains(product);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: FilledButton(
                onPressed: () {
                  final wasAdded = ref
                      .read(cartItemsProvider.notifier)
                      .addItemToCart(product);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        wasAdded
                            ? 'Successully added to cart'
                            : 'Removed From cart',
                      ),
                    ),
                  );
                },
                child: const Text('Add To Cart')),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: FilledButton(
                onPressed: () {
                  //ref.read(cartItemsProvider.notifier).addItemToCart(product);
                },
                child: const Text('Buy Now')),
            label: '',
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Image.asset('assets/images/${product.image}'),
                    Positioned(
                      top: 15,
                      left: 15,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SizedBox(
                          width: 35,
                          height: 35,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      right: 15,
                      child: GestureDetector(
                        onTap: () => navigate(context, const CartScreen()),
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color:
                                  isAddedToCart ? Colors.amber : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.shopping_cart_checkout,
                              color:
                                  isAddedToCart ? Colors.white : Colors.amber,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: DraggableScrollableSheet(
                  builder: (context, sheetController) => SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              product.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 10),
                            SpecsList(specs: specs),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    product = widget.product;
    if (product is Laptop) {
      specs = {
        "storage": "${product.storage}",
        "ram": "${product.ram}",
        "core": "${product.core}",
      };
    } else if (product is Mobile) {
      specs = {
        "Memory": "${product.storage} by ${product.ram}",
        "Front Camera": "${product.cameraFront} MP",
        "Back Camera": "${product.cameraBack} MP",
        "Battery": "${product.battery}",
      };
    }
  }
}
