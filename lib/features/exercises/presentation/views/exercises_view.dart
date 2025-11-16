import '../../../../core/utils/app_colors.dart';
import '../../../home/data/models/workout_model.dart';
import '../widgets/exercise_floating_action_button.dart';
import '../widgets/Exercises_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExercisesView extends StatelessWidget {
  const ExercisesView(
      {super.key, required this.workoutId, required this.workoutModel});

  final String workoutId;
  // The model that will be passed when navigating to this screen
  final WorkoutModel workoutModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ExerciseFloatingActionButton(workoutId: workoutId),
      appBar: AppBar(
        backgroundColor: AppColors.kWhiteColor,
        surfaceTintColor: Colors.transparent, // ✅ disable Material 3 tinting

        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.kBlack87Color,
          ),
        ),
        title: Text(
          workoutModel.workoutName,
          style: const TextStyle(
            color: AppColors.kBlackColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ExercisesViewBody(
        workoutModel: workoutModel,
        workoutId: workoutId,
      ),
    );
  }
}
