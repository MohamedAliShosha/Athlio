import 'package:athlio/features/home_details/presentation/widgets/exercise_details_dialog_text_field.dart';
import 'package:flutter/material.dart';

class NewWorkoutDialog extends StatelessWidget {
  const NewWorkoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return AlertDialog(
      backgroundColor: Colors.black87,
      title: const Text(
        "New workout",
        style: TextStyle(color: Colors.white),
      ),
      content: ExerciseDetailsDialogTextField(
          controller: controller, hintText: 'workout name / اسم التمرين'),
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
