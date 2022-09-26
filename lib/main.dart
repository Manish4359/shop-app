import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart-provider.dart';
import 'package:shop_app/screens/product-detail.dart';
import './screens/product_overview.dart';

import './provider/products-provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
          //value: ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        )
      ],
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductOverview(),
        initialRoute: '/',
        routes: {ProductDetail.routeName: (context) => const ProductDetail()},
      ),
    );
  }
}
