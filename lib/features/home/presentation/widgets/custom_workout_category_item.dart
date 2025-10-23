import 'package:athlio/features/home/presentation/widgets/date_picker_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/functions/build_snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../data/models/workout_model.dart';
import '../manager/add_workout/add_workout_cubit.dart';

class CustomWorkoutCategoryItem extends StatefulWidget {
  const CustomWorkoutCategoryItem({
    super.key,
    required this.workoutModel,
    this.onPressed,
  });

  final WorkoutModel workoutModel;
  final VoidCallback? onPressed;

  @override
  State<CustomWorkoutCategoryItem> createState() =>
      _CustomWorkoutCategoryItemState();
}

class _CustomWorkoutCategoryItemState extends State<CustomWorkoutCategoryItem> {
  String? selectedDate;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(
        const Duration(
          days: 31,
        ),
      ),
      builder: (context, child) {
        return buildDatePickerTheme(context, child);
      },
    );

    if (pickedDate != null) {
      setState(() {
        // Formatted date will "be DayName, dd/MM/yyyy" => Friday, 25/05/2023
        selectedDate = DateFormat('EEEE, dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kBlack87Color,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _pickDate, // opens date picker
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 16,
                        color: AppColors.kWhite54Color,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        selectedDate ?? "Pick a date",
                        style: TextStyles.regular16.copyWith(
                          color: AppColors.kWhiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.workoutModel.workoutName,
                  style: TextStyles.bold18.copyWith(
                    color: AppColors.kWhiteColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    widget.workoutModel.delete();
                    context.read<WorkoutCubit>().getAllWorkouts();
                    ScaffoldMessenger.of(context).showSnackBar(
                      buildSnackBar(message: "Deleted Successfully"),
                    );
                  },
                  icon: const Icon(Icons.delete, color: AppColors.kRedColor),
                ),
                const Icon(Icons.arrow_forward_ios,
                    color: AppColors.kWhiteColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
