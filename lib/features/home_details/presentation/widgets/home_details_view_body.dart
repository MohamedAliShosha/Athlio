import 'package:athlio/features/home/data/models/workout_model.dart';
import 'package:athlio/features/home_details/presentation/widgets/exercises_list_view.dart';
import 'package:flutter/material.dart';

class HomeDetailsViewBody extends StatelessWidget {
  const HomeDetailsViewBody({
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
