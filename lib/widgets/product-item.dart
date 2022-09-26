import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart-provider.dart';
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
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<CartProvider>(context, listen: false);

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
              onPressed: () {
                cart.addcartItems(
                    productId: product.id,
                    price: product.price,
                    title: product.title,
                    imageUrl: product.imageUrl);
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            ),
            leading: Consumer<Product>(
              builder: (context, product, child) => IconButton(
                onPressed: () => product.toggleFavourite(),
                // color: child,
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
              //  child: Color(Colors.amber),
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
