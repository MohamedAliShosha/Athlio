import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isWide;

  const WorkoutCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.isWide = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isWide ? double.infinity : 160,
      margin: EdgeInsets.only(right: isWide ? 0 : 12, bottom: isWide ? 16 : 0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.kBlack87Color,
        borderRadius: BorderRadius.circular(16),
        border:
            Border.all(color: AppColors.kGreenColor.withOpacity(0.5), width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.kGreenColor.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isWide ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.kWhiteColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 12),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: AppColors.kGreenColor,
          //       foregroundColor: AppColors.kWhiteColor,
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //     ),
          //     onPressed: () {
          //       // Navigate to workout details here
          //     },
          //     child: const Text(
          //       "Show",
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
