import 'package:athlio/core/utils/constants.dart';
import 'package:athlio/features/home/data/models/workout_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'add_workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit() : super(AddWorkoutInitial());

  // Open the Hive box where the user's workouts are stored
  final addWorkoutCategoryBox =
      Hive.box<WorkoutModel>(Constants.workoutCategoriesBox);

  // List to store all workouts
  List<WorkoutModel> workoutsList = [];

  // Fetch all workouts from the Hive box

  void getAllWorkouts() {
    // reversed used to
    workoutsList = addWorkoutCategoryBox.values.toList();

    emit(AddWorkoutSuccess(workoutsList: workoutsList));
  }

  // Add a new workout to Hive and update the UI instantly
  Future<void> addWorkout(WorkoutModel categoriesModel) async {
    await addWorkoutCategoryBox.add(categoriesModel);

    workoutsList = addWorkoutCategoryBox.values.toList();

    emit(AddWorkoutSuccess(workoutsList: workoutsList));
  }

  Future<void> deleteWorkout(int index) async {
    await addWorkoutCategoryBox.deleteAt(index);
    workoutsList = addWorkoutCategoryBox.values.toList();
    emit(AddWorkoutSuccess(workoutsList: workoutsList));
  }

  Future<void> updateWorkout(int index, WorkoutModel updatedWorkout) async {
    await addWorkoutCategoryBox.putAt(index, updatedWorkout);
    workoutsList = addWorkoutCategoryBox.values.toList();
    emit(AddWorkoutSuccess(workoutsList: workoutsList));
  }
}
