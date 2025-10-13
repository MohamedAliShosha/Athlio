import '../../data/models/exercise_details_model.dart';
import '../manager/exercise_cubit/exercise_cubit.dart';
import 'exercise_details_dialog_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseDetailsDialog extends StatefulWidget {
  final String workoutId;

  const ExerciseDetailsDialog({
    super.key,
    required this.workoutId,
  });

  @override
  State<ExerciseDetailsDialog> createState() => _ExerciseDetailsDialogState();
}

class _ExerciseDetailsDialogState extends State<ExerciseDetailsDialog> {
  final TextEditingController exerciseNameController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController numberOfRepsController = TextEditingController();
  final TextEditingController numberOfSetsController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    exerciseNameController.dispose();
    weightController.dispose();
    numberOfRepsController.dispose();
    numberOfSetsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ExerciseDetailsDialogTextField(
              validator: (data) {
                if (data == null || data.isEmpty) {
                  return 'Please enter an exercise name / ادخل اسم التمرين';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: exerciseNameController,
              hintText: 'Exercise name(اسم التمرين)',
            ),
            const SizedBox(height: 10),
            ExerciseDetailsDialogTextField(
              validator: (data) {
                if (data == null || data.isEmpty) {
                  return 'Please enter weight / ادخل الوزن';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: weightController,
              hintText: 'Weight / الوزن (kg)',
            ),
            const SizedBox(height: 10),
            ExerciseDetailsDialogTextField(
              validator: (data) {
                if (data == null || data.isEmpty) {
                  return 'Please enter number of reps / ادخل عدد التكرارات';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: numberOfRepsController,
              hintText: 'Reps /  عدد التكرارات',
            ),
            const SizedBox(height: 10),
            ExerciseDetailsDialogTextField(
              validator: (data) {
                if (data == null || data.isEmpty) {
                  return 'Please enter number of sets / ادخل عدد المجموعات';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: numberOfSetsController,
              hintText: 'Sets (عدد المجموعات)',
            )
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel", style: TextStyle(color: Colors.black)),
        ),
        ElevatedButton(
          onPressed: () async {
            // Save workout logic here
            if (_formKey.currentState!.validate()) {
              final exerciseModel = ExerciseModel(
                exerciseName: exerciseNameController.text.trim(),
                workoutId: widget.workoutId,
                weight: weightController.text.trim(),
                numberOfReps: numberOfRepsController.text.trim(),
                numberOfSets: numberOfSetsController.text.trim(),
              );
              await BlocProvider.of<ExerciseCubit>(context)
                  .addExercise(exerciseModel);
            }
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
