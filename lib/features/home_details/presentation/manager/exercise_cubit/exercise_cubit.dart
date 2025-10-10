import 'package:athlio/core/utils/constants.dart';
import 'package:athlio/features/home_details/data/models/exercise_details_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseCubit() : super(ExerciseInitial());

  List<ExerciseModel> exercisesList = [];
  final exerciseBox = Hive.box<ExerciseModel>(Constants.exerciseDetailsBox);

  /*
    Instead of showing all exercises, this method filters only the ones that belong to a specific workout ID.
    It’s called whenever we open a workout’s details screen.
   */
  /// 2️⃣ Added filtering logic in ExerciseCubit
  void getExercisesByWorkoutId(String workoutId) {
    exercisesList = exerciseBox.values
        .where((exercise) => exercise.workoutId == workoutId)
        .toList();

    emit(ExerciseLoaded(exerciseList: exercisesList));
  }

  Future<void> addExercise(ExerciseModel exerciseModel) async {
    await exerciseBox.add(exerciseModel);
    getExercisesByWorkoutId(exerciseModel.workoutId);
  }
}
