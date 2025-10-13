import '../../../../core/functions/build_snack_bar.dart';
import '../../data/models/exercise_details_model.dart';
import '../manager/exercise_cubit/exercise_cubit.dart';
import 'tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseItem extends StatefulWidget {
  final ExerciseModel exerciseModel;

  const ExerciseItem({
    super.key,
    required this.exerciseModel,
  });

  @override
  State<ExerciseItem> createState() => _ExerciseItemState();
}

class _ExerciseItemState extends State<ExerciseItem> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // The Container that holds card contents
          Container(
            // Padding is the space between the container and its child.
            // Margin is the space between the container and the widgets around it.
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: widget.exerciseModel.isDone
                  ? Colors.green
                  : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left side: Exercise details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.exerciseModel.exerciseName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // By default, the wrap layout is horizontal and both the children and the runs are aligned to the start.
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TagWidget(
                              tagTitle: widget.exerciseModel.weight,
                            ),
                            const SizedBox(width: 16),
                            TagWidget(
                              tagTitle: widget.exerciseModel.numberOfReps,
                            ),
                            const SizedBox(width: 16),
                            TagWidget(
                              tagTitle: widget.exerciseModel.numberOfSets,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                // Right side: Actions
                Column(
                  children: [
                    // Checkbox
                    Checkbox(
                      value: widget.exerciseModel.isDone,
                      // checkBox background color when it is checked
                      activeColor: Colors.white,
                      // check sign color
                      checkColor: Colors.green,
                      onChanged: (value) async {
                        setState(() {
                          // Update the checkbox value if the value is done it will be passed to isDone attribute of ExerciseModel
                          widget.exerciseModel.isDone = value ?? false;
                        });
                        // To keep the data saved even when the app is restarted
                        await widget.exerciseModel.save();
                        // To stay async with the UI
                        BlocProvider.of<ExerciseCubit>(context)
                            .getExercisesByWorkoutId(
                                widget.exerciseModel.workoutId);
                      },
                    ),
                    // Action buttons row
                    IconButton(
                      icon:
                          const Icon(Icons.delete, color: Colors.red, size: 25),
                      onPressed: () {
                        widget.exerciseModel.delete();
                        BlocProvider.of<ExerciseCubit>(context)
                            .getExercisesByWorkoutId(
                          widget.exerciseModel.workoutId,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          buildSnackBar(message: "Deleted successfully!"),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
