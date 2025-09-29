import 'package:athlio/features/workout_categories/presentation/widgets/workout_category_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WorkoutCategoriesListView(),
        // Upper body button
      ],
    );
  }
}
