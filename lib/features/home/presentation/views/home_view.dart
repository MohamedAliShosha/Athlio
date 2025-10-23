import '../widgets/drawer_app_bar.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/home_view_body.dart';
import '../widgets/add_workout_floating_action_button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      key: scaffoldKey,
      appBar: drawerAppBar(
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        },
      ),

      /// Floating Action Button -> opens New Workout Dialog
      floatingActionButton: const AddWorkoutFloatingActionButton(),
      body: const SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
