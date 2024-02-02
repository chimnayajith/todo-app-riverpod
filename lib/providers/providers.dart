import 'package:flutter/material.dart';
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

final colorProvider = AutoDisposeStateProvider<Color>((ref) {
  return Color.fromARGB(255, 206, 242, 254);
});
