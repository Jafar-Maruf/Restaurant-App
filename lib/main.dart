import 'package:basic_restaurant_app/core/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseInitializer.initialize();
  await initializeDependency();
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      getPages: AppPages.routes,
      initialRoute: AppPages.splash,
    );
  }
}
