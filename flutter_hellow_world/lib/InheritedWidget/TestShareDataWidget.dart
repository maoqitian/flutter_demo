 /// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/11/15 0015
/// email: maoqitian068@163.com
/// des:  测试 ShareDataWidget
import 'package:flutter/material.dart';
import 'package:flutter_hellow_world/InheritedWidget/ShareDataWidget.dart';


class TestShareDataWidget extends StatefulWidget {
  @override
  _TestShareDataWidgetState createState() => _TestShareDataWidgetState();
}

class _TestShareDataWidgetState extends State<TestShareDataWidget> {


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //上层 widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    //显示 ShareDataWidget 数据变化，如果build中没有依赖InheritedWidget，则此回调不会被调用。
    return Text(ShareDataWidget.of(context).data.toString());

  }
}

