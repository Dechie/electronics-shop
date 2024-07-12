import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/laptop.dart';

final laptopFavProvider =
    StateNotifierProvider<LaptopFavoritesNotifier, List<Laptop>>(
  (ref) => LaptopFavoritesNotifier(),
);

class LaptopFavoritesNotifier extends StateNotifier<List<Laptop>> {
  LaptopFavoritesNotifier() : super([]);

  bool toggleLaptopFavorite(Laptop laptop) {
    if (!state.contains(laptop)) {
      state = [...state, laptop];
      print('new state:');
      print(state);
      return true;
    } else {
      state = state.where((l) => l.id != laptop.id).toList();
      print('new state:');
      print(state);
      return false;
    }
  }
}
