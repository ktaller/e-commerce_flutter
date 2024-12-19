import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dio_functions.dart';
import 'product_detail.dart';

class ProductListPage extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products available.'));
          }

          final products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: Image.network(
                    product['image'], // Product image URL
                    height: 60,
                    width: 60,
                    fit: BoxFit.fitHeight,
                  ),
                  title: Text(
                    product['title'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text('ID: ${product['id']}'),
                  onTap: () {
                    Get.to(() => ProductDetailPage(productId: product['id']));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
