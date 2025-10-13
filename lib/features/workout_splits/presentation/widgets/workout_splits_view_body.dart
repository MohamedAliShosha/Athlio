import 'workout_split_selection.dart';
import 'package:flutter/material.dart';

class WorkoutSplitsViewBody extends StatelessWidget {
  const WorkoutSplitsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ----- Pro Split -----
          WorkoutSplitSection(
            title: "Pro Split",
            description:
                "Bench Press, Barbell Row, Shoulder Press, Bicep Curl, Squat",
          ),

          SizedBox(height: 25),

          // ----- Push Pull Legs -----
          WorkoutSplitSection(
            title: "Push Pull Legs",
            description:
                "Push – Bench Press & Overhead Press | Pull – Deadlift & Pull-up | Legs – Squat & Leg Press",
          ),

          SizedBox(height: 25),

          // ----- Upper & Lower -----
          WorkoutSplitSection(
            title: "Upper & Lower",
            description:
                "Upper – Pull-ups, Bench Press, Rows | Lower – Squats, Lunges, Romanian Deadlift",
          ),

          SizedBox(height: 25),

          // ----- Arnold Split -----
          WorkoutSplitSection(
            title: "Arnold Split",
            description:
                "Chest/Back – Bench Press & Barbell Row | Arms/Shoulders – Curls & Lateral Raises | Legs – Squats & Calf Raises",
          ),

          SizedBox(height: 25),

          // ----- Full Body -----
          WorkoutSplitSection(
            title: "Full Body",
            description:
                "Squat, Bench Press, Deadlift, Pull-up, Overhead Press, Plank",
          ),

          SizedBox(height: 25),

          // ----- Bro Split -----
          WorkoutSplitSection(
            title: "Bro Split",
            description:
                "Chest – Incline Press | Back – Lat Pulldown | Legs – Leg Extension | Arms – Curls & Dips",
          ),
        ],
      ),
    );
  }
}
