import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:curnectgate/core/config/app_routes.dart';


class AuthGuard extends AutoRouteGuard {
  // Temporary mock function
  bool _checkAuth() {
    // Replace with real implementation later
    log("Auth check not implemented yet - returning false");
    return false;
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isAuthenticated = _checkAuth();
    
    if (isAuthenticated) {
      resolver.next(true);
    } else {
      router.pushNamed(AppRoutes.login);
    }
  }
}



