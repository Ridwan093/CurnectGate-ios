// Riverpod Providers
import 'package:flutter_riverpod/flutter_riverpod.dart';


final tabIndexProvider = StateProvider<int>((ref) => 0);
final searchQueryProvider = StateProvider<String>((ref) => '');
final isSearchingProvider = StateProvider<bool>((ref) => false);