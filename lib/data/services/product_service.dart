import 'package:dio/dio.dart';
import '../models/product_model.dart';

class ProductService {
  final Dio _dio = Dio();

  Future<Product> fetchProducts() async {
    try {
      final response = await _dio.get('https://dummyjson.com/products');
      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
