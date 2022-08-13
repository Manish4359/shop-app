import 'package:flutter/material.dart';
import 'package:shop_app/screens/product-grid.dart';
import './../widgets/product-item.dart';
import '../provider/product.dart';

class ProductOverview extends StatelessWidget {
  ProductOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MyShop'),
        ),
        body: new ProductGrid());
  }
}
