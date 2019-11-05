/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/11/5 0005
/// email: maoqitian068@163.com
/// des:   web view 页面
import 'package:flutter/material.dart';


class WebViewPage extends StatefulWidget {

  final String url;
  final String title;

  WebViewPage(this.url,this.title);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Text("WebViewPage Page"),
      ),
    );
  }
}
