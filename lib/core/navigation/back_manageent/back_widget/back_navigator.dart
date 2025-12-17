import 'package:curnectgate/core/navigation/back_manageent/back_provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BackButtonHandler extends ConsumerWidget {
  final Widget child;

  const BackButtonHandler({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backPressNotifier = ref.read(backPressProvider.notifier);
    final backPressState = ref.watch(backPressProvider);

    if (backPressState.showSnackBar) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Press back again to exit'),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      });
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          final router = GoRouter.of(context);
          final routeMatch = router.routerDelegate.currentConfiguration;
          final fullPath = routeMatch.matches.last.matchedLocation;
          final canPop = router.canPop();

          debugPrint('Current path: $fullPath');
          debugPrint('Can pop: $canPop');
          debugPrint(
            'Route stack: ${routeMatch.matches.map((m) => m.matchedLocation)}',
          );

          if (fullPath == '/') {
            final shouldExit = await backPressNotifier.handleBackPress(context);
            if (shouldExit && context.mounted) SystemNavigator.pop();
          } else if (fullPath == '/dash_board' ||
              fullPath == '/security-dashboard' && !canPop) {
            final shouldExit = await backPressNotifier.handleBackPress(context);
            if (shouldExit && context.mounted) SystemNavigator.pop();
          } else if (canPop) {
            backPressNotifier.reset();
            router.pop();
          } else {
            debugPrint('No navigation action possible');
          }
        }
      },
      child: child,
    );
  }
}
