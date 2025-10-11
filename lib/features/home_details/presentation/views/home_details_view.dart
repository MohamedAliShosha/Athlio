import 'package:athlio/features/home/data/models/workout_model.dart';
import 'package:athlio/features/home_details/presentation/manager/exercise_cubit/exercise_cubit.dart';
import 'package:athlio/features/home_details/presentation/widgets/exercise_details_dialog.dart';
import 'package:athlio/features/home_details/presentation/widgets/home_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeDetailsView extends StatelessWidget {
  const HomeDetailsView(
      {super.key, required this.workoutId, required this.workoutModel});

  final String workoutId;
  // The model that will be passed when navigating to this screen
  final WorkoutModel workoutModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(
            context: context,
            // 3️⃣ Created WorkoutDetailsView => When you navigate to this screen, it immediately loads only the exercises linked to that workout ID and displays them in a ListView
            builder: (_) => BlocProvider.value(
              value: BlocProvider.of<ExerciseCubit>(context),
              child: ExerciseDetailsDialog(
                workoutId: workoutId,
              ),
            ),
          );
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
        title: Text(
          workoutModel.workoutName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: HomeDetailsViewBody(
        workoutModel: workoutModel,
        workoutId: workoutId,
      ),
    );
  }
}
