import 'package:get/get.dart';
import '../data/models/product_model.dart';
import '../data/services/product_service.dart';

class ProductController extends GetxController {
  var products = <Products>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var productData = await ProductService().fetchProducts();

      products.assignAll(productData.products ?? []);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products');
    } finally {
      isLoading(false);
    }
  }
}
