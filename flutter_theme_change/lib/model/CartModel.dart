import 'dart:collection';

/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/11/18 0018
/// email: maoqitian068@163.com
/// des:  
import 'package:flutter/material.dart';

import 'Item.dart';

class CartModel extends ChangeNotifier{

  // 用于保存购物车中商品列表
  final List<Item> _items = [];

  // 禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  //购物车商品总价
  double get totalPrice {
    return _items.fold(0,(value, item) => value + item.count * item.price);
  }

  // 将 [item] 添加到购物车。这是唯一一种能从外部改变购物车的方法。
  void add (Item item){
    _items.add(item);
    // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();

  }

}