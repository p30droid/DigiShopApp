import 'package:digi_shop_app/ui/cart/cart_page.dart';
import 'package:digi_shop_app/ui/detail/product_detail_page.dart';
import 'package:digi_shop_app/ui/home/home_page.dart';
import 'package:digi_shop_app/ui/intro/intro_page.dart';
import 'package:digi_shop_app/ui/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/intro', page: ()=>const IntroPage()),
        GetPage(name: '/home', page: ()=>const HomePage()),
        GetPage(name: '/login', page: ()=>const LoginPage()),
        GetPage(name: '/product_detail', page: ()=>const ProductDetailPage()),
        GetPage(name: '/cart', page: ()=>const CartPage())
      ],
      initialRoute: '/intro',
    );
  }
}
