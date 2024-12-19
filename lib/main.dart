import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_explorer/home_page.dart';
import 'products_page.dart';

void main() {
  runApp(ProductExplorerApp());
}

class ProductExplorerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Product Explorer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
