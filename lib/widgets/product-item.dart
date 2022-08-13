import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/product-detail.dart';

import '../provider/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;

  // final String imageUrl;
  ProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetail.routeName,
            arguments: product.id);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Color.fromARGB(255, 39, 39, 39).withOpacity(0.7),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            leading: IconButton(
              onPressed: () => product.toggleFavourite(),
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
              ),
            ),
            title: Text(
              product.title,
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
