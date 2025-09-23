import 'package:athlio/features/workout_categories/presentation/widgets/new_workout_dialog.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: Colors.black87,
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => const NewWorkoutDialog(),
        );
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
