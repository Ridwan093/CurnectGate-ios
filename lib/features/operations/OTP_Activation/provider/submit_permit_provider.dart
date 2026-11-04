import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemListProvider = StateProvider<List<Map<String, dynamic>>>((ref) => []);
final schedulitemListProvider = StateProvider<List<Map<String, dynamic>>>((ref) => []);