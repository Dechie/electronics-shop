import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_shop/models/mobile.dart';

final mobileFavProvider =
    StateNotifierProvider<MobileFavoritesNotifier, List<Mobile>>(
  (ref) => MobileFavoritesNotifier(),
);

class MobileFavoritesNotifier extends StateNotifier<List<Mobile>> {
  MobileFavoritesNotifier() : super([]);

  bool toggleMobileFavorite(Mobile mobile) {
    if (!state.contains(mobile)) {
      state = [...state, mobile];
      return true;
    } else {
      state = state.where((m) => m.id != mobile.id).toList();
      return false;
    }
  }
}
