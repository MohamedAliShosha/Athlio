import 'package:hive/hive.dart';

part 'categories_model.g.dart';

@HiveType(typeId: 0) // Giving a unique ID for each class
class CategoriesModel extends HiveObject {
  @HiveField(0)
  final String workoutName;
  @HiveField(1)
  final DateTime date;

  CategoriesModel({
    required this.workoutName,
    required this.date,
  });
}
