import 'package:flutter/material.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  void addCart(ProductModel product) {
    if (productExist(product)) {
      int index =
          _carts.indexWhere((element) => element.product.id == product.id);
      _carts[index] = CartModel(
        id: _carts[index].id,
        product: _carts[index].product,
        quantity: _carts[index].quantity + 1,
      );
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          product: product,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeCart(int id) {
    _carts.removeWhere((cart) => cart.id == id);
    notifyListeners();
  }

  void addQuantity(int id) {
    int index = _carts.indexWhere((cart) => cart.id == id);
    if (index != -1) {
      _carts[index] = CartModel(
        id: _carts[index].id,
        product: _carts[index].product,
        quantity: _carts[index].quantity + 1,
      );
      notifyListeners();
    }
  }

  void reduceQuantity(int id) {
    int index = _carts.indexWhere((cart) => cart.id == id);
    if (index != -1) {
      int newQuantity = _carts[index].quantity - 1;
      if (newQuantity > 0) {
        _carts[index] = CartModel(
          id: _carts[index].id,
          product: _carts[index].product,
          quantity: newQuantity,
        );
      } else {
        _carts.removeAt(index);
      }
      notifyListeners();
    }
  }

  int totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity;
    }
    return total;
  }

  double totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.quantity * item.product.price);
    }
    return total;
  }

  bool productExist(ProductModel product) {
    return _carts.any((element) => element.product.id == product.id);
  }
}
