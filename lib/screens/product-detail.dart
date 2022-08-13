import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/products-provider.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  static final routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final routeId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProductData =
        Provider.of<ProductsProvider>(context, listen: false).findById(routeId);
    return Scaffold(
      appBar: AppBar(title: Text('data')),
      body: Container(
        child: Text(loadedProductData.title),
      ),
    );
  }
}
