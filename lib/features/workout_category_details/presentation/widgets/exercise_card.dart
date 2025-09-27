import 'package:athlio/core/functions/build_snack_bar.dart';
import 'package:athlio/features/workout_category_details/presentation/widgets/tag_widget.dart';
import 'package:flutter/material.dart';

class ExerciseCard extends StatefulWidget {
  final String exerciseName;
  final List<String> tags;

  const ExerciseCard({
    super.key,
    required this.exerciseName,
    required this.tags,
  });

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // The Container that holds card contents
          Container(
            // Padding is the space between the container and its child.
            // Margin is the space between the container and the widgets around it.
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isChecked ? Colors.green : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left side: Exercise details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.exerciseName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // By default, the wrap layout is horizontal and both the children and the runs are aligned to the start.
                      Wrap(
                        spacing: 8,
                        children:
                            widget.tags.map((tag) => buildTag(tag)).toList(),
                      ),
                    ],
                  ),
                ),

                // Right side: Actions
                Column(
                  children: [
                    // Checkbox
                    Checkbox(
                      value: isChecked,
                      // checkBox background color when it is checked
                      activeColor: Colors.white,
                      // check sign color
                      checkColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                    ),
                    // Action buttons row
                    IconButton(
                      icon:
                          const Icon(Icons.delete, color: Colors.red, size: 25),
                      onPressed: () {
                        // TODO: Delete action
                        ScaffoldMessenger.of(context).showSnackBar(
                          buildSnackBar(message: "Deleted successfully!"),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
