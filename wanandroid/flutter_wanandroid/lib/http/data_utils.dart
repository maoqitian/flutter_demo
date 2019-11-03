/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019-11-03
/// email: maoqitian068@163.com
/// des:  数据获取帮助类


import 'package:flutter_wanandroid/api/Api.dart';
import 'package:flutter_wanandroid/http/http_utils.dart';
import 'package:flutter_wanandroid/model/bannerdata.dart';



class DataUtils{


  //获取首页banner 数据

  static Future getBannerData() async{

    var response = await HttpUtils.get(Api.BANNER_JSON);

    List<BannerData> responseList = [];

    if(response != null && response['errorCode'] == 0){

      for (int i = 0; i < response['data'].length; i++) {
        Map<String, dynamic> json = response['data'][i];
        responseList.add(BannerData.fromJSON(
            {"id": json['id'],"desc": json['desc'],
              "imagePath": json['imagePath'],"isVisible": json['isVisible'],
              "order": json['order'],
              "title": json['title'],
              "type": json['type'],
              "url": json['url']}));
      }
      return responseList;
    }else{
      return [];
    }

  }

}
