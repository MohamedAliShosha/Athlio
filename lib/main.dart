import 'package:athlio/core/routing/app_router.dart';
import 'package:flutter/material.dart';

class Athlio extends StatelessWidget {
  const Athlio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Playfair Display',
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}

void main() {
  runApp(const Athlio());
}
