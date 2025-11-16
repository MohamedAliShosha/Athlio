part of 'add_workout_cubit.dart';

@immutable
sealed class WorkoutState {}

final class AddWorkoutInitial extends WorkoutState {}

final class AddWorkoutSuccess extends WorkoutState {
  final List<WorkoutModel> workoutsList;

  AddWorkoutSuccess({required this.workoutsList});
}

final class AddWorkoutFailure extends WorkoutState {
  final String errorMessage;

  AddWorkoutFailure({required this.errorMessage});
}
