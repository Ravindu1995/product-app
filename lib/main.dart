import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/app/bindings/initial_bindings.dart';
import 'package:product_app/app/routes/routes.dart';
import 'app/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAqGDZGDYBevhIh2EOkH3c65w1QCTllDXU',
      appId: '1:35441432988:android:86094d363b5ebe84f49059',
      messagingSenderId: '35441432988',
      projectId: 'product-app-abb91',
      storageBucket: 'product-app-abb91.appspot.com',
    ),
  );
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
