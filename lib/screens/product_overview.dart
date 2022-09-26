import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/products-provider.dart';
import 'package:shop_app/screens/product-grid.dart';
import '../provider/cart-provider.dart';
import './../widgets/product-item.dart';
import '../provider/product.dart';
import 'package:badges/badges.dart';

enum FilterOptions { Favorites, All }

class ProductOverview extends StatefulWidget {
  ProductOverview({Key? key}) : super(key: key);

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  bool _showFavOnly = false;

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context, listen: false);
    final cart = Provider.of<CartProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyShop'),
          actions: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60))),
              child: Badge(
                badgeContent: Text("${cart.cartItems.length}"),
                showBadge: cart.cartItems.isNotEmpty,
                child: Icon(Icons.shopping_cart),
              ),
            ),
            PopupMenuButton(
              onSelected: ((FilterOptions selected) {
                setState(() {
                  if (selected == FilterOptions.Favorites) {
                    _showFavOnly = true;
                  } else if (selected == FilterOptions.All) {
                    _showFavOnly = false;
                  }
                });
              }),
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                const PopupMenuItem(
                  child: Text('only favorites'),
                  value: FilterOptions.Favorites,
                ),
                const PopupMenuItem(
                  child: Text('show all'),
                  value: FilterOptions.All,
                )
              ],
            )
          ],
        ),
        body: new ProductGrid(
          showFavOnly: this._showFavOnly,
        ));
  }
}
