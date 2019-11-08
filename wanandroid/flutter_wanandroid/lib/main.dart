/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/10/30 0030
/// email: maoqitian068@163.com
/// des: 说明，本项目基本搭建参考于 flutter_go 项目，项目地址 https://github.com/alibaba/flutter-go

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/routers/application.dart';
import 'package:flutter_wanandroid/routers/routes.dart';
import 'package:flutter_wanandroid/views/app_page.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp(){
    // 注册 fluro routes
    final Router router = Router();
    Routes.configureRoutes(router);
    // 设置环境变量 router
    Application.router = router;
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  int themeColor = 0xFFFFC800;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'titles',
      theme: new ThemeData(
        primaryColor: Color(this.themeColor),
        backgroundColor: Color(0xFFEFEFEF),
        accentColor: Color(0xFF888888),
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
        ),
        iconTheme: IconThemeData(
          color: Color(this.themeColor),
          size: 35.0,
        ),
      ),
      home: new Scaffold(
        body: AppPage(),
      ),
      /// 生成路由
      onGenerateRoute: Application.router.generator,
    );
  }
}

