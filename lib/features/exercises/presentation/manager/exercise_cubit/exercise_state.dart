part of 'exercise_cubit.dart';

@immutable
sealed class ExerciseState {}

final class ExerciseInitial extends ExerciseState {}

final class ExerciseLoaded extends ExerciseState {
  final List<ExerciseModel> exerciseList;

  ExerciseLoaded({required this.exerciseList});
}

final class ExerciseFailure extends ExerciseState {
  final String errorMessage;

  ExerciseFailure({required this.errorMessage});
}
