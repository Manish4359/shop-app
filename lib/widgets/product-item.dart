import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;

  final String imageUrl;
  ProductItem(
      {Key? key, required this.id, required this.imageUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imageUrl,
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
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
        ),
        title: Text(
          this.title,
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
