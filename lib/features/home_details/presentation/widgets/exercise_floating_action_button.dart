import 'package:athlio/core/utils/app_colors.dart';
import 'package:athlio/features/home_details/presentation/manager/exercise_cubit/exercise_cubit.dart';
import 'package:athlio/features/home_details/presentation/widgets/exercise_details_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseFloatingActionButton extends StatelessWidget {
  const ExerciseFloatingActionButton({
    super.key,
    required this.workoutId,
  });

  final String workoutId;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: AppColors.kBlack87Color,
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
      child: const Icon(Icons.add, color: AppColors.kWhiteColor),
    );
  }
}
