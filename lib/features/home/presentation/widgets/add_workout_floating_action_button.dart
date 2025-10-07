import 'package:athlio/features/home/presentation/manager/add_workout/add_workout_cubit.dart';
import 'package:athlio/features/home/presentation/widgets/new_workout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddWorkoutFloatingActionButton extends StatelessWidget {
  const AddWorkoutFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: Colors.black,
      onPressed: () {
        showDialog(
          context: context,
          /*
            - Providing the cubit first for the home view to give an instance to the floating action button, then using BlocProvider.value() to inject it into the dialog
            - Using BlocProvider.value() enables me to:
          ✅ Reuses the existing Cubit "WorkoutCubit that provided for HomeView" instance from the current context  
          ✅ Injects it into the dialog
          ✅ Ensures both the main screen and the dialog share the same Cubit
           */
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<WorkoutCubit>(context),
            child: const NewWorkoutDialog(),
          ),
        );
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
