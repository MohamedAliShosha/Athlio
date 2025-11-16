import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'workout_model.g.dart';

@HiveType(typeId: 0)
class WorkoutModel extends HiveObject {
  @HiveField(0)
  final String workoutName;
  @HiveField(1)
  String? date;
  @HiveField(2)
  String? id;

  WorkoutModel({required this.workoutName, this.date, String? id})
      // Creating a unique id for each added model
      : id = id ?? const Uuid().v4();
}
