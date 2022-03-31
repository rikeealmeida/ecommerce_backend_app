import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_manager/screens/new_product_screen.dart';
import 'package:get/route_manager.dart';

import 'screens/orders_screen.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      getPages: [
        GetPage(
          name: '/products',
          page: () => ProductsScreen(),
        ),
        GetPage(
          name: '/products/new',
          page: () => NewProductScreen(),
        ),
        GetPage(
          name: '/orders',
          page: () => OrdersScreen(),
        )
      ],
    );
  }
}
