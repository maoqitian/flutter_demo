/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/11/18 0018
/// email: maoqitian068@163.com
/// des:  
import 'package:flutter/material.dart';


class ThemeModel extends ChangeNotifier {
  int settingThemeColor ;
  ThemeModel(this.settingThemeColor);

  void changeTheme (int themeColor){
    this.settingThemeColor = themeColor;
    // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();

  }
}
