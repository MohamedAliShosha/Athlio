import 'package:athlio/core/di/service_locator.dart';
import 'package:athlio/core/utils/constants.dart';
import 'package:athlio/core/routing/app_router.dart';
import 'package:athlio/core/utils/shared_pref_helper.dart';
import 'package:athlio/core/utils/shared_pref_keys.dart';
import 'package:athlio/features/home/data/models/workout_model.dart';
import 'package:athlio/features/home_details/data/models/exercise_details_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Athlio extends StatelessWidget {
  const Athlio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}

Future<void> checkIfUserIsLoggedIn() async {
  // Getting userToken and storing it in a variable
  final userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  // Check if the userToken is not null and not empty
  if (userToken != null && userToken.isNotEmpty) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await Hive.initFlutter(); // Initializing Hive
  // Registering Hive adapter of the first model
  Hive.registerAdapter(WorkoutModelAdapter());
  // Registering Hive adapter of the second model
  Hive.registerAdapter(ExerciseModelAdapter());
  // Opening the first box
  await Hive.openBox<WorkoutModel>(Constants.workoutCategoriesBox);
  // Opening the second box
  await Hive.openBox<ExerciseModel>(Constants.exerciseDetailsBox);
  await checkIfUserIsLoggedIn();
  runApp(const Athlio());
}
