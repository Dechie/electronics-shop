import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartItemsProvider =
    StateNotifierProvider<CartItemsNotifier, List<dynamic>>(
  (ref) => CartItemsNotifier(),
);

class CartItemsNotifier extends StateNotifier<List<dynamic>> {
  CartItemsNotifier() : super([]);

  bool addOrRemoveItemInCart(dynamic item) {
    if (!state.contains(item)) {
      state = [...state, item];
      return true;
    } else {
      state = state.where((it) => it.id != item.id).toList();
      return false;
    }
  }
}
