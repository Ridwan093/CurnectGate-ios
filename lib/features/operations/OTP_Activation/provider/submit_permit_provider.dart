import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemListProvider = StateProvider<List<Map<String, dynamic>>>((ref) => []);