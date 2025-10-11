import 'package:flutter/material.dart';

class WorkoutSplitsView extends StatelessWidget {
  const WorkoutSplitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Workout Programs",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- Pro Split Section -----
            const Text(
              "Pro Split Workout",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Train each muscle group separately for maximum focus",
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  WorkoutCard(
                      title: "Chest Day", subtitle: "Bench, Flyes, Pushups"),
                  WorkoutCard(
                      title: "Back Day", subtitle: "Rows, Deadlifts, Pullups"),
                  WorkoutCard(
                      title: "Shoulder Day", subtitle: "Press, Lateral Raises"),
                  WorkoutCard(
                      title: "Arms Day", subtitle: "Curls, Dips, Extensions"),
                  WorkoutCard(
                      title: "Leg Day", subtitle: "Squats, Lunges, Press"),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ----- Push Pull Legs Section -----
            const Text(
              "Push Pull Legs Workout",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Efficient compound-focused training split",
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 16),
            const WorkoutCard(
              title: "Push Day",
              subtitle: "Chest, Shoulders & Triceps",
              isWide: true,
            ),
            const WorkoutCard(
              title: "Pull Day",
              subtitle: "Back & Biceps",
              isWide: true,
            ),
            const WorkoutCard(
              title: "Leg Day",
              subtitle: "Lower Body Strength",
              isWide: true,
            ),
          ],
        ),
      ),
    );
  }
}

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
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.withOpacity(0.5), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.1),
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
              color: Colors.white,
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
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // Navigate to workout details here
              },
              child: const Text("Start"),
            ),
          )
        ],
      ),
    );
  }
}
