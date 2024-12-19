import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com/'));

  Future<List<dynamic>> fetchProducts() async {
    final response = await _dio.get('products');
    return response.data;
  }

  Future<Map<String, dynamic>> fetchProductDetails(int productId) async {
    final response = await _dio.get('products/$productId');
    return response.data;
  }
}
