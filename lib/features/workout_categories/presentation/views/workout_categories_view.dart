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
            // Placeholder for the green body grid
            Center(
              child: Wrap(
                spacing: 4,
                runSpacing: 4,
                children: List.generate(
                  30,
                  (index) => Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Upper body button
            _buildCategoryButton(
              context,
              title: "UPPER BODY",
              onPressed: () {},
            ),

            // Lower body button
            _buildCategoryButton(
              context,
              title: "LOWER BODY",
              onPressed: () {},
            ),
          ],
        ),
      ),

      // Floating Action Button -> opens New Workout Dialog
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => const NewWorkoutDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context,
      {required String title, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
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
            const Icon(Icons.fitness_center, color: Colors.white),
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

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
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          hintText: "Workout name",
          hintStyle: TextStyle(color: Colors.white54),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white54),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel", style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          onPressed: () {
            final workoutName = controller.text.trim();
            if (workoutName.isNotEmpty) {
              // Save workout logic here
              Navigator.pop(context);
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: const Text("Save"),
        ),
      ],
    );
  }
}
