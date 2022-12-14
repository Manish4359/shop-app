import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products-provider.dart';
import '../widgets/product-item.dart';
import '../provider/product.dart';

class ProductGrid extends StatelessWidget {
  bool showFavOnly = false;
  ProductGrid({Key? key, required this.showFavOnly}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context);
    final products =
        showFavOnly ? productData.favoriteItems : productData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          //create: (context) => products[index],
          value: products[index],
          child: ProductItem(

              //  id: products[index].id,
              //imageUrl: products[index].imageUrl,
              //title: products[index].title
              ),
        );
      },
    );
  }
}
