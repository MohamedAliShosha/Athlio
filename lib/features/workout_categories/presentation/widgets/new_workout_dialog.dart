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
      content: TextField(
        cursorColor: Colors.white,
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          hintText: "Workout name",
          hintStyle: TextStyle(color: Colors.white54),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white54),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
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
