import 'package:athlio/features/login/presentation/views/login_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    // Define your routes here
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginView(),
    ),
  ]);
}
