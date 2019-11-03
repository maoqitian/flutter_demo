/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/11/1 0001
/// email: maoqitian068@163.com
/// des:  首页最新博文 page
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/api/Api.dart';
import 'package:flutter_wanandroid/http/data_utils.dart';
import 'package:flutter_wanandroid/http/http_utils.dart';
import 'package:flutter_wanandroid/model/bannerdata.dart';


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {


  List <BannerData> _bannerList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DataUtils.getBannerData().then((bannerList){
       _bannerList = bannerList;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Text("最新博文 Page"),
      ),
    );
  }
}

