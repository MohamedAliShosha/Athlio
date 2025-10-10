import 'package:athlio/core/routing/app_router.dart';
import 'package:athlio/features/home/presentation/manager/add_workout/add_workout_cubit.dart';
import 'package:athlio/features/home/presentation/widgets/custom_workout_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WorkoutCategoriesListView extends StatefulWidget {
  const WorkoutCategoriesListView({
    super.key,
  });

  @override
  State<WorkoutCategoriesListView> createState() =>
      _WorkoutCategoriesListViewState();
}

class _WorkoutCategoriesListViewState extends State<WorkoutCategoriesListView> {
  late WorkoutCubit addWorkoutCubit;
  @override
  void initState() {
    addWorkoutCubit = BlocProvider.of<WorkoutCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutCubit, WorkoutState>(
      listener: (context, state) {
        if (state is AddWorkoutSuccess) {
          // Accessing The empty list that I have created it inside the cubit "addWorkoutCubit.workoutsList" then filling it with the workoutsList that I have received from the state
          addWorkoutCubit.workoutsList = state.workoutsList;
        }
      },
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: addWorkoutCubit.workoutsList.length,
            itemBuilder: (context, index) => CustomWorkoutCategoryItem(
              workoutModel: addWorkoutCubit.workoutsList[index],
              onPressed: () {
                // Navigating to the new screen based on each screen id
                GoRouter.of(context).push(
                    '${AppRouter.kWorkoutCategoryDetailsView}/${addWorkoutCubit.workoutsList[index].id}');
              },
            ),
          ),
        );
      },
    );
  }
}
