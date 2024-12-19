import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_explorer/products_page.dart';
import 'custom_button.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          children: [
            Image.asset(
              'assets/open.jpg',
              height: 80,
            ),const SizedBox(width: 10),const Text(
              'stAr shop',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,


      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/shop.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 2), // Spacing to account for the AppBar

                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Welcome here..',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Short Paragraph
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: Colors.white70),
                  ),
                ),
                const SizedBox(height: 30),

                CustomButton(
                  width: 300,
                  height: 40,
                  radius: 12,
                  color: Colors.blue,
                  myFun: () {
                    Get.to(ProductListPage());
                  },
                  child: const Text("Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
