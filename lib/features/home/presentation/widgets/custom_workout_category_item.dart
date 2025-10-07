import 'package:athlio/core/functions/build_snack_bar.dart';
import 'package:athlio/features/home/data/models/workout_model.dart';
import 'package:athlio/features/home/presentation/manager/add_workout/add_workout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomWorkoutCategoryItem extends StatelessWidget {
  const CustomWorkoutCategoryItem(
      {super.key, this.onPressed, required this.workoutModel});

  final void Function()? onPressed;

  final WorkoutModel workoutModel;
  @override
  Widget build(BuildContext context) {
    // Format the date to 'dd/MM/yyyy'

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side → Date
            Text(
              workoutModel.date,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),

            // Center → Title
            Expanded(
              child: Center(
                child: Text(
                  workoutModel.workoutName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Right side → Icons (delete + arrow)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    workoutModel.delete();
                    BlocProvider.of<WorkoutCubit>(context).getAllWorkouts();
                    ScaffoldMessenger.of(context).showSnackBar(
                      buildSnackBar(message: "Deleted Successfully"),
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
