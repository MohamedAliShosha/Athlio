import 'package:athlio/features/workout_categories/presentation/widgets/custom_floating_action_button.dart';
import 'package:athlio/features/workout_categories/presentation/widgets/custom_workout_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WorkoutCategoriesView extends StatelessWidget {
  const WorkoutCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) => Slidable(
                  key: ValueKey(
                      index), // Each element in a ListView has a unique key using an index. This is important so that Flutter can differentiate between elements and keep the open drag state for each element.
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      CustomSlidableAction(
                        onPressed: (context) {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: 100,
                          height: 60,
                          alignment: Alignment.center,
                          child: const Icon(Icons.delete, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  child: CustomWorkoutCategoryItem(
                    title: "Chest",
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            // Upper body button
          ],
        ),
      ),

      /// Floating Action Button -> opens New Workout Dialog
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
