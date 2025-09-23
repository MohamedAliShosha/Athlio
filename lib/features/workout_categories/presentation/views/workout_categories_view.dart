import 'package:athlio/features/workout_categories/presentation/widgets/custom_floating_action_button.dart';
import 'package:flutter/material.dart';

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
                itemBuilder: (context, index) => _buildCategoryButton(
                  context,
                  title: "Chest",
                  onPressed: () {},
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

  Widget _buildCategoryButton(BuildContext context,
      {required String title, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.fitness_center_rounded,
              color: Colors.white,
              size: 30,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
