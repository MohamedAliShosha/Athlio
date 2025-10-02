import 'package:athlio/features/home_details/presentation/widgets/exercise_card.dart';
import 'package:athlio/features/home_details/presentation/widgets/exercise_details_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeDetailsView extends StatelessWidget {
  const HomeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.black87,
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => ExerciseDetailsDialog(controller: controller));
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Chest",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ExerciseCard(
                    exerciseName: "Bench Press",
                    tags: ["10 kg", "12 reps", "3 sets"],
                  ),
                  ExerciseCard(
                    exerciseName: "Incline Dumbbell Press",
                    tags: ["20 kg", "12 reps", "3 sets"],
                  ),
                  ExerciseCard(
                    exerciseName: "Push-Ups",
                    tags: ["14 kg", "30 reps", "3 sets"],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
