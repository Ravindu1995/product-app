import 'package:get/get.dart';
import 'package:product_app/app/bindings/initial_bindings.dart';
import 'package:product_app/app/routes/routes_name.dart';
import 'package:product_app/views/splash_view.dart';

class AppPages {
  //static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashView(),
      binding: InitialBindings(),
    ),
  ];
}
