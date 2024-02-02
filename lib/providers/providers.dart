import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

final dateProvider = AutoDisposeStateProvider<DateTime>((ref) {
  return DateTime.now();
});

final priorityProvider = AutoDisposeStateProvider<String>((ref) {
  return "low";
});
