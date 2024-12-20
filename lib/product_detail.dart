import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:product_explorer/products_page.dart';
import 'custom_button.dart';
import 'dio_functions.dart';

class ProductDetailPage extends StatelessWidget {
  final int productId;
  final ApiService apiService = ApiService();

  ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details',style: TextStyle(fontWeight: FontWeight.bold),)),
      body: FutureBuilder<Map<String, dynamic>>(
        future: apiService.fetchProductDetails(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Product not found.'));
          }

          final product = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.network(product['image'], height: 200, fit: BoxFit.cover)),
                const SizedBox(height: 16),
                Center(child: Text('Title: ${product['title']}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                const SizedBox(height: 8),
                Text('ID: ${product['id']}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                const Text('Description:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(product['description'], style: const TextStyle(fontSize: 14)),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: CustomButton(
              width: 300,
              height: 40,
              radius: 12,
              color: Colors.grey,
              myFun: () {
              Get.to(());
              },
              child: const Text("Add to Cart"),
              ),
            ),
          ),],),

          );
        },
      ),

    );
  }
}
