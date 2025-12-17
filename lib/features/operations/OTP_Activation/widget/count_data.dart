import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountDataForAll<T> extends ConsumerWidget {
  final ProviderListenable<AsyncValue<T?>> provider;
  final Widget Function(T data) builder;
  final Widget? emptyBody;

  const CountDataForAll({
    super.key,
    required this.provider,
    required this.builder,
    this.emptyBody,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(provider);

    return asyncValue.when(
      data: (data) {
        if (data == null) {
          return emptyBody ?? const SizedBox.shrink();
        }
        return builder(data);
      },
      loading: () {
        final cached = asyncValue.value;
        if (cached != null) return builder(cached);
        return emptyBody ?? const SizedBox.shrink();
      },
      error: (error, stack) {
        // Detect session expiry and trigger global dialog

        // For session expired + no cache: just show empty
        return emptyBody ?? const SizedBox.shrink();
      },
    );
  }
}
