import 'package:hive/hive.dart';

part 'workout_model.g.dart';

@HiveType(typeId: 0)
class WorkoutModel extends HiveObject {
  @HiveField(0)
  final String workoutName;
  @HiveField(1)
  final String date;

  WorkoutModel({required this.workoutName, required this.date});
}
