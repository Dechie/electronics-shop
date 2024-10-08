import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_shop/models/laptop.dart';
import 'package:mobile_shop/screens/cart_screen.dart';
import 'package:mobile_shop/screens/home_screen.dart';
import 'package:mobile_shop/services/auth/auth_services.dart';
import 'package:mobile_shop/services/providers/cart_items.dart';
import 'package:mobile_shop/utils/method_utils.dart';
import 'package:mobile_shop/widgets/specs_list.dart';

import '../../models/auth_state.dart';
import '../../models/mobile.dart';
import '../../utils/constants.dart';

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
  String priceStr = '';
  bool itsAdded = false;
  bool isAddedToCart = false;

  bool isAuthChecking = false;

  late AuthState authState;
  Map<String, dynamic> specs = {};
  var product;
  DraggableScrollableController sheetController =
      DraggableScrollableController();

  void addProductToCart(WidgetRef ref) {
    final wasAdded =
        ref.read(cartItemsProvider.notifier).addOrRemoveItemInCart(product);
    setState(() {
      itsAdded = wasAdded;
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          wasAdded ? 'Successully added to cart' : 'Removed From cart',
        ),
      ),
    );
  }

  //authState =
  @override
  Widget build(BuildContext context) {
    authState = ref.watch(authStateProvider);

    List cartItems = ref.watch(cartItemsProvider);
    isAddedToCart = cartItems.contains(product);

    List<MapEntry<String, dynamic>> specsTop = specs.entries
        .where((entry) => entry.key.length <= 10 && entry.value.length <= 10)
        .take(2)
        .toList();
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: FilledButton(
                onPressed: () async {
                  await ref.read(authStateProvider.notifier).checkAuthed();
                  if (authState.user == null) {
                    ref
                        .read(authStateProvider.notifier)
                        .setRedirectRoute("/product-detail");
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Auth State checked, no uer"),
                      ),
                    );
                    if (mounted) {
                      // ignore: use_build_context_synchronously
                      //navigate(context, const LoginScreen());
                      //navigate(context, const RegisterScreen());
                      Navigator.pushNamed(context, "/register");
                    }
                    //return;
                  } else {
                    addProductToCart(ref);
                  }
                },
                child: authState.isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        isAddedToCart ? 'Remove' : 'Add To Cart',
                      ),
              ),
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
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .5,
              child: Image.asset(
                product.image.isEmpty
                    ? 'assets/images/s8.jpg'
                    : 'assets/images/${product.image}',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 15,
              left: 15,
              child: GestureDetector(
                onTap: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                  (context) => false,
                ),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: mainRed,
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
                  width: 40,
                  height: 40,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: isAddedToCart ? mainRed : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.shopping_cart_checkout,
                      color: isAddedToCart ? Colors.white : mainRed,
                    ),
                  ),
                ),
              ),
            ),
            DraggableScrollableSheet(
              maxChildSize: 1.0,
              minChildSize: 0.6,
              initialChildSize: 0.6,
              builder: (context, sheetController) => SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    //color: Colors.blue,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: SingleChildScrollView(
                    controller: sheetController,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            priceStr,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 20),
                          SpecsList(
                            specEntries: specsTop,
                          ),
                          const SizedBox(height: 20),
                          ...specs.entries.map(
                            (entry) => SizedBox(
                              width: double.infinity,
                              height: 20,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      entry.key,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      entry.value.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    product = widget.product;

    priceStr = product.price.round().toString();
    priceStr = '${priceStr.substring(0, 2)},${priceStr.substring(2)}';
    priceStr += " Birr";

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
        "Battery": "${product.battery} mAh",
      };
      //product.image = "s8.jpg";
    }
  }
}
