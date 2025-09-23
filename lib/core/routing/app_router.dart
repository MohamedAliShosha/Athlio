import 'package:athlio/features/login/presentation/views/login_view.dart';
import 'package:athlio/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:athlio/features/sign_up/presentation/views/sign_up_view.dart';
import 'package:athlio/features/workout_categories/presentation/views/workout_categories_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kLoginView = '/loginView';
  static const String kSignUpView = '/signUpView';
  static const String kWorkoutCategoriesView = '/workoutCategoriesView';
  static final router = GoRouter(
    routes: [
      // Define your routes here
      GoRoute(
        path: '/',
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kWorkoutCategoriesView,
        builder: (context, state) => const WorkoutCategoriesView(),
      ),
    ],
  );
}
