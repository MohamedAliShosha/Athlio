import '../../../home/data/models/workout_model.dart';
import 'exercises_list_view.dart';
import 'package:flutter/material.dart';

class ExercisesViewBody extends StatelessWidget {
  const ExercisesViewBody({
    super.key,
    required this.workoutId,
    required this.workoutModel,
  });
  final String workoutId;
  // 3️⃣ Added WorkoutModel
  final WorkoutModel workoutModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExercisesListView(workoutId: workoutId),
          ],
        ),
      ),
    );
  }
}
