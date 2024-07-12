import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/laptop.dart';

final allFavProvider =
    StateNotifierProvider<AllFavoritesNotifier, List<dynamic>>(
  (ref) => AllFavoritesNotifier(),
);

class AllFavoritesNotifier extends StateNotifier<List<dynamic>> {
  AllFavoritesNotifier() : super([]);

  bool toggleItemFavorite(dynamic item) {
    if (!state.contains(item)) {
      state = [...state, item];
      print('new state:');
      print(state);
      return true;
    } else {
      state = state.where((it) => it.id != item.id).toList();
      print('new state:');
      print(state);
      return false;
    }
  }

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

  bool toggleMobileFavorite(dynamic item) {
    if (!state.contains(item)) {
      state = [...state, item];
      print('added to all favorites');
      print('current state:');
      print(state);
      return true;
    } else {
      state = state.where((m) => m.id != item.id).toList();
      print('current state:');
      print(state);
      print('removed from all favorites');
      return false;
    }
  }
}
