import 'package:flutter/material.dart';

import '../modules/food.dart';
class Shop extends ChangeNotifier{
  final List <Food>  _FoodMenu =[
    Food(name: 'momoes', price: '80', imagePath: 'assets/images/momoes.png', rating: '4.8'),
    Food(name: 'momo', price: '100', imagePath: 'assets/images/momo1.png', rating: '4.8'),
  ];
  List<Food> _cart =[

  ];
  List<Food> get foodMenu => _FoodMenu;
  List<Food> get cart => _cart;

  void addTocart(Food foodItem, int quantity){
    for(int i=0;i<quantity;i++){
      _cart.add(foodItem);
    }
    notifyListeners();
  }
  void removeFromCart(Food food){
    _cart.remove(food);
    notifyListeners();
  }
}