import 'package:athlio/core/di/service_locator.dart';
import 'package:athlio/features/login/presentation/manager/login/login_cubit.dart';
import 'package:athlio/features/login/presentation/views/login_view.dart';
import 'package:athlio/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:athlio/features/profile/presentation/views/profile_view.dart';
import 'package:athlio/features/home/presentation/views/home_view.dart';
import 'package:athlio/features/home_details/presentation/views/home_details_view.dart';
import 'package:athlio/features/sign_up/presentation/manager/sign_up/sign_up_cubit.dart';
import 'package:athlio/features/sign_up/presentation/views/sign_up_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kLoginView = '/loginView';
  static const String kSignUpView = '/signUpView';
  static const String kProfileView = '/profileView';
  static const String kHomeView = '/home';
  static const String kWorkoutCategoryDetailsView =
      '/workoutCategoryDetailsView';
  static final router = GoRouter(
    routes: [
      // Define your routes here
      GoRoute(
        path: '/',
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<SignUpCubit>(),
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kWorkoutCategoryDetailsView,
        builder: (context, state) => const HomeDetailsView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
    ],
  );
}
