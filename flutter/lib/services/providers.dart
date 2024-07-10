import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_shop/services/api_services.dart';

import '../models/laptop.dart';
import '../models/mobile.dart';

final apiservicesProvider = Provider((ref) => ApiServices());

final laptopsProvider = FutureProvider<List<Laptop>>((ref) async {
  final apiService = ref.read(apiservicesProvider);
  return apiService.fetchLaptops();
});

final mobilesProvider = FutureProvider<List<Mobile>>(
  (ref) async {
    final apiService = ref.read(apiservicesProvider);
    return apiService.fetchMobiles();
  },
);
