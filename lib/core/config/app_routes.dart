abstract class AppRoutes {
  // Auth
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';

  // Dashboard
  static const String home = '/home';
  static const String profile = '/profile';

  // Settings
  static const String settings = '/settings';
  static const String notifications = '/settings/notifications';

  // Dynamic/ID-based routes
  static String userDetails(String id) => '/user/$id';
}