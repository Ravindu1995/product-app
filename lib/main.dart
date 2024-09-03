import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/app/bindings/initial_bindings.dart';
import 'package:product_app/app/routes/routes.dart';
import 'app/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product List',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialBinding: InitialBindings(),
      getPages: AppPages.routes,
    );
  }
}
