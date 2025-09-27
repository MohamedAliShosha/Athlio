import 'package:athlio/core/routing/app_router.dart';
import 'package:athlio/features/workout_categories/presentation/widgets/custom_workout_category_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WorkoutCategoriesListView extends StatelessWidget {
  const WorkoutCategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) => CustomWorkoutCategoryItem(
          title: "Chest",
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kWorkoutCategoryDetailsView);
          },
        ),
      ),
    );
  }
}
