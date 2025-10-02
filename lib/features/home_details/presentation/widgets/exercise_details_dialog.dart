import 'package:athlio/features/home_details/presentation/widgets/exercise_details_dialog_text_field.dart';
import 'package:flutter/material.dart';

class ExerciseDetailsDialog extends StatelessWidget {
  const ExerciseDetailsDialog({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black87,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ExerciseDetailsDialogTextField(
            controller: controller,
            hintText: 'Exercise name(اسم التمرين)',
          ),
          const SizedBox(height: 10),
          ExerciseDetailsDialogTextField(
            controller: controller,
            hintText: 'Weight / الوزن (kg)',
          ),
          const SizedBox(height: 10),
          ExerciseDetailsDialogTextField(
            controller: controller,
            hintText: 'Reps /  عدد التكرارات',
          ),
          const SizedBox(height: 10),
          ExerciseDetailsDialogTextField(
            controller: controller,
            hintText: 'Sets (عدد المجموعات)',
          )
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel", style: TextStyle(color: Colors.black)),
        ),
        ElevatedButton(
          onPressed: () {
            final workoutName = controller.text.trim();
            if (workoutName.isNotEmpty) {
              // Save workout logic here
              Navigator.pop(context);
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
