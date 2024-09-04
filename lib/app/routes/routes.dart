import 'package:get/get.dart';
import 'package:product_app/app/bindings/initial_bindings.dart';
import 'package:product_app/app/routes/routes_name.dart';
import 'package:product_app/views/home/home_view.dart';
import 'package:product_app/views/login/login_view.dart';
import 'package:product_app/views/profile/profile_view.dart';
import 'package:product_app/views/splash_view.dart';

class AppPages {
  //static const INITIAL = Routes.HOME;

  static final routes = [
    // GetPage(
    //   name: Routes.splashScreen,
    //   page: () => const SplashView(),
    //   binding: InitialBindings(),
    // ),
    GetPage(
      name: Routes.loginView,
      page: () => LoginView(),
      binding: InitialBindings(),
    ),
    GetPage(
      name: Routes.homeView,
      page: () => HomeView(),
      binding: InitialBindings(),
    ),
    // GetPage(
    //   name: Routes.DETAIL,
    //   page: () => DetailView(),
    //   binding: InitialBindings(),
    // ),
    GetPage(
      name: Routes.profileView,
      page: () => ProfileView(),
      binding: InitialBindings(),
    ),
  ];
}
