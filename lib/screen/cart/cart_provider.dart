import 'package:flutter/cupertino.dart';
import 'package:hamroshop/models/cart_model.dart';
import 'package:hamroshop/screen/cart/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  DBHelper db = DBHelper();
  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;

  Future<List<Cart>> getData() async {
    _cart = db.getCartList();
    return _cart;
  }

  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item') ?? 0;
    _totalPrice = prefs.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  List<dynamic> _cartItems = [];

  List<dynamic> get cartItems => _cartItems;

  void addCartItem(dynamic product) {
  _cartItems.add(product);
  // Ensure offerPrice is properly parsed to double
  double offerPrice = double.tryParse(product['offerPrice'] ?? '0.0') ?? 0.0;
  addTotalPrice(offerPrice);
  notifyListeners();
}


  void removeCartItem(dynamic product) {
  _cartItems.remove(product);
  double offerPrice = double.parse(product['offerPrice'] ?? '0.0');
  removeTotalPrice(offerPrice);
  notifyListeners();
  
  }
 void clearCart() {
    _cartItems.clear();
    notifyListeners(); // Notify listeners after clearing the cart
  }


  void addTotalPrice(double productPrice) {
    _totalPrice += productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice -= productPrice;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefItems();
    return _totalPrice;
  }

  void addCounter() {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removerCounter() {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefItems();
    return _counter;
  }
}
