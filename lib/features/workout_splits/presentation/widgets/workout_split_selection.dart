import 'workout_card.dart';
import 'package:flutter/material.dart';

/// A reusable widget to display each workout split section cleanly
class WorkoutSplitSection extends StatelessWidget {
  final String title;
  final String description;

  const WorkoutSplitSection({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Train each muscle group with these example exercises:",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),

        // Workout Card now shows examples instead of the description
        WorkoutCard(
          title: title,
          subtitle: description, // shows the examples
          isWide: true,
        ),
      ],
    );
  }
}
