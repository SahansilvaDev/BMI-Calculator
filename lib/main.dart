///imports material and GetX packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Import Routes file that where been set routes
import 'app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        useMaterial3: true,
        // Define the brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          brightness: Brightness.light,
        ),
      ),
      initialRoute: AppRoutes.home,
      getPages: AppPages.routes,
    );
  }
}
