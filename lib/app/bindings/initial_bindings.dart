import 'package:get/get.dart';
import 'package:product_app/controllers/product_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
