import 'package:athlio/features/workout_categories/presentation/widgets/custom_drawer.dart';
import 'package:athlio/features/workout_categories/presentation/widgets/home_view_body.dart';
import 'package:athlio/features/workout_categories/presentation/widgets/custom_floating_action_button.dart';
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
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),

        key: scaffoldKey,
        appBar: buildAppBar(),
        backgroundColor: Colors.white,
        body: const HomeViewBody(),

        /// Floating Action Button -> opens New Workout Dialog
        floatingActionButton: const CustomFloatingActionButton(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black87,
      elevation: 0,
      leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          }),
    );
  }
}
