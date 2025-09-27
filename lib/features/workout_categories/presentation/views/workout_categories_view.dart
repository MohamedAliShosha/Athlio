import 'package:athlio/features/workout_categories/presentation/widgets/custom_floating_action_button.dart';
import 'package:athlio/features/workout_categories/presentation/widgets/workout_category_list_view.dart';
import 'package:flutter/material.dart';

class WorkoutCategoriesView extends StatelessWidget {
  const WorkoutCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WorkoutCategoriesListView(),
            // Upper body button
          ],
        ),
      ),

      /// Floating Action Button -> opens New Workout Dialog
      floatingActionButton: CustomFloatingActionButton(),
    );
  }
}
