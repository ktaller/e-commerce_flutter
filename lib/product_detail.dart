import 'package:flutter/material.dart';
import 'dio_functions.dart';

class ProductDetailPage extends StatelessWidget {
  final int productId;
  final ApiService apiService = ApiService();

  ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: apiService.fetchProductDetails(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Product not found.'));
          }

          final product = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(product['image'], height: 200, fit: BoxFit.cover),
                SizedBox(height: 16),
                Text('Title: ${product['title']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('ID: ${product['id']}', style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Text('Description:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(product['description'], style: TextStyle(fontSize: 14)),
              ],
            ),
          );
        },
      ),
    );
  }
}
