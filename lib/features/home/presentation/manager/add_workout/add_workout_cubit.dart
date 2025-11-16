import '../../../../../core/utils/constants.dart';
import '../../../data/models/workout_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'add_workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit() : super(AddWorkoutInitial());

  // List to store all workouts
  List<WorkoutModel> workoutsList = [];

  // Accessing the Hive box where the user's workouts are stored
  final addWorkoutCategoryBox =
      Hive.box<WorkoutModel>(Constants.workoutCategoriesBox);

  // Fetch all workouts from the Hive box

  void getAllWorkouts() {
    // Storing all workouts in the list
    workoutsList = addWorkoutCategoryBox.values.toList();
    // Emitting a new successful state that contains the updated list of workouts
    emit(AddWorkoutSuccess(workoutsList: workoutsList));
  }

  // Add a new workout to Hive and update the UI instantly
  Future<void> addWorkout(WorkoutModel workoutModel) async {
    await addWorkoutCategoryBox.add(workoutModel);

    // Updating the list that contains all workouts after adding a new one
    workoutsList = addWorkoutCategoryBox.values.toList();

    // Emitting a new successful state that contains the updated list of workouts
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
