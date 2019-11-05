/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/11/5 0005
/// email: maoqitian068@163.com
/// des:  轮播图 widget
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/components/home_banner.dart';
import 'package:flutter_wanandroid/http/data_utils.dart';
import 'package:flutter_wanandroid/model/bannerdata.dart';
import 'package:url_launcher/url_launcher.dart';


class BannerPage extends StatefulWidget {
  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {

  //轮播图数据
  List <BannerData> _bannerList = [];
  //存放每个 banner
  List<Widget> _list = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key('__header__'),
      children: _list,
    );
  }

  void loadData() async{
    var list = await DataUtils.getBannerData();
      setState(() {
        _bannerList = list;
        if(_bannerList.length > 0 ){
          _list.add(HomeBanner(_bannerList,(bannerData){
            _launchURL('${bannerData.url}');
          }));
        }
      });
    }

}


