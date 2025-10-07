import 'package:athlio/features/home/data/models/workout_model.dart';
import 'package:athlio/features/home/presentation/manager/add_workout/add_workout_cubit.dart';
import 'package:athlio/features/home_details/presentation/widgets/exercise_details_dialog_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NewWorkoutDialog extends StatefulWidget {
  const NewWorkoutDialog({super.key});

  @override
  State<NewWorkoutDialog> createState() => _NewWorkoutDialogState();
}

class _NewWorkoutDialogState extends State<NewWorkoutDialog> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  late WorkoutCubit addWorkoutCubit;

  @override
  void initState() {
    addWorkoutCubit = BlocProvider.of<WorkoutCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AlertDialog(
        backgroundColor: Colors.black,
        title: const Text(
          "New workout",
          style: TextStyle(color: Colors.white),
        ),
        content: ExerciseDetailsDialogTextField(
          validator: (data) {
            if (data == null || data.trim().isEmpty) {
              return 'Please enter workout name';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          hintText: 'workout name / اسم التمرين',
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.black)),
          ),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                // Get the entered workout name
                final workoutName = controller.text.trim();
                final now = DateTime.now();
                final formattedDate =
                    DateFormat('EEEE, MMM d, yyyy').format(now);
                // Save workout logic
                await addWorkoutCubit.addWorkout(
                  WorkoutModel(
                    workoutName: workoutName,
                    date: formattedDate, // Default to current date
                  ),
                );

                // Close the dialog
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
