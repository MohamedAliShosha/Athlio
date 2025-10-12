import 'package:athlio/core/utils/app_colors.dart';
import 'package:athlio/features/home/data/models/workout_model.dart';
import 'package:athlio/features/home_details/presentation/widgets/exercise_floating_action_button.dart';
import 'package:athlio/features/home_details/presentation/widgets/home_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeDetailsView extends StatelessWidget {
  const HomeDetailsView(
      {super.key, required this.workoutId, required this.workoutModel});

  final String workoutId;
  // The model that will be passed when navigating to this screen
  final WorkoutModel workoutModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ExerciseFloatingActionButton(workoutId: workoutId),
      appBar: AppBar(
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
      body: HomeDetailsViewBody(
        workoutModel: workoutModel,
        workoutId: workoutId,
      ),
    );
  }
}
