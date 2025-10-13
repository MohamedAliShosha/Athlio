import '../../../../core/functions/build_app_bar.dart';
import '../widgets/workout_splits_view_body.dart';
import 'package:flutter/material.dart';

class WorkoutSplitsView extends StatelessWidget {
  const WorkoutSplitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        leadingWidget: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        context,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white, // used to change the color of the text
        title: "Workout Programs",

        centerTitle: true,
      ),
      body: const WorkoutSplitsViewBody(),
    );
  }
}
