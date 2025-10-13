import '../../../../core/utils/app_colors.dart';
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
      appBar: buildAppBar(),
      body: const HomeViewBody(),

      /// Floating Action Button -> opens New Workout Dialog
      floatingActionButton: const AddWorkoutFloatingActionButton(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.kWhiteColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: AppColors.kBlack87Color,
        ),
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        },
      ),
    );
  }
}
