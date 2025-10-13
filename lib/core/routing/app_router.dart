import '../di/service_locator.dart';
import '../../features/home/data/models/workout_model.dart';
import '../../features/home/presentation/manager/add_workout/add_workout_cubit.dart';
import '../../features/exercises/presentation/manager/exercise_cubit/exercise_cubit.dart';
import '../../features/login/presentation/manager/login/login_cubit.dart';
import '../../features/login/presentation/views/login_view.dart';
import '../../features/onboarding/presentation/view/onboarding_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/exercises/presentation/views/home_details_view.dart';
import '../../features/sign_up/presentation/manager/sign_up/sign_up_cubit.dart';
import '../../features/sign_up/presentation/views/sign_up_view.dart';
import '../../features/workout_splits/presentation/views/workout_splits_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kLoginView = '/loginView';
  static const String kSignUpView = '/signUpView';
  static const String kProfileView = '/profileView';
  static const String kWorkoutSplitsView = '/workoutSplitsView';
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
        builder: (context, state) => BlocProvider(
          create: (context) => WorkoutCubit()..getAllWorkouts(),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        // Defines a dynamic route that can carry an ID
        path: '$kWorkoutCategoryDetailsView/:workoutId',
        builder: (context, state) {
          // Extracts the workout ID from the route
          final workoutId =
              state.pathParameters['workoutId']!; // getting the id
          return BlocProvider(
            create: (context) =>
                ExerciseCubit()..getExercisesByWorkoutId(workoutId),
            child: ExercisesView(
                workoutId: workoutId,
                workoutModel: state.extra as WorkoutModel), //  passing id
          );
        },
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kWorkoutSplitsView,
        builder: (context, state) => const WorkoutSplitsView(),
      ),
    ],
  );
}
