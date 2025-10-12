import 'package:athlio/features/workout_splits/presentation/widgets/workout_card.dart';
import 'package:flutter/material.dart';

class WorkoutSplitsViewBody extends StatelessWidget {
  const WorkoutSplitsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ----- Pro Split Section -----
          const Text(
            "Pro Split Workout",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Train each muscle group separately for maximum focus",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 170,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                WorkoutCard(
                    title: "Chest Day", subtitle: "Bench, Flyes, Pushups"),
                WorkoutCard(
                    title: "Back Day", subtitle: "Rows, Deadlifts, Pullups"),
                WorkoutCard(
                    title: "Shoulder Day", subtitle: "Press, Lateral Raises"),
                WorkoutCard(
                    title: "Arms Day", subtitle: "Curls, Dips, Extensions"),
                WorkoutCard(
                    title: "Leg Day", subtitle: "Squats, Lunges, Press"),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // ----- Push Pull Legs Section -----
          const Text(
            "Push Pull Legs Workout",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Efficient compound-focused training split",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const WorkoutCard(
            title: "Push Day",
            subtitle: "Chest, Shoulders & Triceps",
            isWide: true,
          ),
          const WorkoutCard(
            title: "Pull Day",
            subtitle: "Back & Biceps",
            isWide: true,
          ),
          const WorkoutCard(
            title: "Leg Day",
            subtitle: "Lower Body Strength",
            isWide: true,
          ),
        ],
      ),
    );
  }
}
