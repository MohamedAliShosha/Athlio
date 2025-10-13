import 'package:hive/hive.dart';

part 'exercise_details_model.g.dart';

@HiveType(typeId: 1)
class ExerciseModel extends HiveObject {
  @HiveField(0)
  final String exerciseName;
  @HiveField(1)
  final String weight;
  @HiveField(2)
  final String numberOfReps;
  @HiveField(3)
  final String numberOfSets;
  @HiveField(4)
  bool isDone;
  // 1️⃣ Added a unique ID for each exercise => This is how each exercise is tied to its parent workout — without it, all exercises would appear together for every workout.
  @HiveField(5)
  final String workoutId;

  ExerciseModel(
      {required this.exerciseName,
      required this.workoutId,
      required this.weight,
      required this.numberOfReps,
      required this.numberOfSets,
      this.isDone = false});
}
