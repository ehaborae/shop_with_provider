import 'package:flutter/material.dart';
import 'package:shop_with_provider/models/product_model.dart';
import 'package:shop_with_provider/pages/cart_page.dart';
import 'package:shop_with_provider/pages/home_page.dart';
import 'package:shop_with_provider/pages/profile_page.dart';
import 'package:shop_with_provider/pages/saved_page.dart';

class AppProviderRepo with ChangeNotifier {
  int currentIndex = 0;
  final List<Widget> pages = [
    const HomePage(),
    const SavedPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  void changePage(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<Product> products = [
    Product(
      id: 1,
      name: 'Product 1',
      description: 'Description 1',
      imageUrl: 'https://picsum.photos/id/1/200/300',
      price: 100,
    ),
    Product(
      id: 2,
      name: 'Product 2',
      description: 'Description 2',
      imageUrl: 'https://picsum.photos/id/2/200/300',
      price: 200,
    ),
    Product(
      id: 3,
      name: 'Product 3',
      description: 'Description 3',
      imageUrl: 'https://picsum.photos/id/3/200/300',
      price: 300,
    ),
    Product(
      id: 4,
      name: 'Product 4',
      description: 'Description 4',
      imageUrl: 'https://picsum.photos/id/4/200/300',
      price: 400,
    ),
    Product(
      id: 5,
      name: 'Product 5',
      description: 'Description 5',
      imageUrl: 'https://picsum.photos/id/5/200/300',
      price: 500,
    ),
    Product(
      id: 6,
      name: 'Product 6',
      description: 'Description 6',
      imageUrl: 'https://picsum.photos/id/6/200/300',
      price: 600,
    ),
    Product(
      id: 7,
      name: 'Product 7',
      description: 'Description 7',
      imageUrl: 'https://picsum.photos/id/7/200/300',
      price: 700,
    ),
    Product(
      id: 8,
      name: 'Product 8',
      description: 'Description 8',
      imageUrl: 'https://picsum.photos/id/8/200/300',
      price: 800,
    ),
    Product(
      id: 9,
      name: 'Product 9',
      description: 'Description 9',
      imageUrl: 'https://picsum.photos/id/9/200/300',
      price: 900,
    ),
    Product(
      id: 10,
      name: 'Product 10',
      description: 'Description 10',
      imageUrl: 'https://picsum.photos/id/10/200/300',
      price: 1000,
    ),
  ];

  List<Product> faveProducts = [];

  void addToFave(Product product) {
    faveProducts.add(product);
    notifyListeners();
  }

  void removeFromFave(Product product) {
    faveProducts.remove(product);
    notifyListeners();
  }

  List<Product> cartProducts = [];

  void addToCart(Product product) {
    cartProducts.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    cartProducts.remove(product);
    notifyListeners();
  }
}
