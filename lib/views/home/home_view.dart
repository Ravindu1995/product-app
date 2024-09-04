import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/product_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product List',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (productController.products.isEmpty) {
          return Center(
              child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Text(
                    'No products found !',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )));
        }

        return ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            var product = productController.products[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: product.thumbnail != null
                    ? Image.network(product.thumbnail!, width: 50, height: 50)
                    : const Icon(Icons.image),
                title: Text(product.title ?? 'No title'),
                subtitle: Text(product.brand ?? 'No Brand'),
                trailing:
                    Text('\$${product.price?.toStringAsFixed(2) ?? '0.00'}'),
              ),
            );
          },
        );
      }),
    );
  }
}
