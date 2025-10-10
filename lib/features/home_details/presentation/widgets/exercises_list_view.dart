import 'package:athlio/features/home_details/presentation/manager/exercise_cubit/exercise_cubit.dart';
import 'package:athlio/features/home_details/presentation/widgets/exercise_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExercisesListView extends StatelessWidget {
  const ExercisesListView({
    super.key,
    required this.workoutId,
  });

  final String workoutId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExerciseCubit, ExerciseState>(
      listener: (context, state) {
        if (state is ExerciseLoaded) {
          // Accessing The empty list that I have created it inside the cubit "addWorkoutCubit.workoutsList" then filling it with the workoutsList that I have received from the state
          BlocProvider.of<ExerciseCubit>(context).exercisesList =
              state.exerciseList;
        }
      },
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount:
                BlocProvider.of<ExerciseCubit>(context).exercisesList.length,
            itemBuilder: (context, index) => ExerciseItem(
              exerciseModel:
                  BlocProvider.of<ExerciseCubit>(context).exercisesList[index],
            ),
          ),
        );
      },
    );
  }
}
