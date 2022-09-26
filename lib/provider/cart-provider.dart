import 'package:flutter/cupertino.dart';
import 'package:shop_app/provider/product.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.imageUrl,
    required this.quantity,
    required this.price,
    required this.title,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

  void addcartItems(
      {required String productId,
      required double price,
      required String title,
      required String imageUrl}) {
    if (!_cartItems.containsKey(productId)) {
      CartItem item = CartItem(
          id: productId,
          imageUrl: imageUrl,
          quantity: 1,
          price: price,
          title: title);
      _cartItems.putIfAbsent(productId, () => item);
    } else {
      _cartItems.update(
        productId,
        (cartItem) => CartItem(
          id: cartItem.id,
          imageUrl: cartItem.imageUrl,
          quantity: cartItem.quantity + 1,
          price: cartItem.price,
          title: cartItem.title,
        ),
      );
    }
    notifyListeners();
  }
}
