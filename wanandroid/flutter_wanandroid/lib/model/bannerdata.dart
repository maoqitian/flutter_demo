/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019-11-03
/// email: maoqitian068@163.com
/// des:  首页 banner model

/**
 * {
    "desc": "Android高级进阶直播课免费学习",
    "id": 23,
    "imagePath": "https://wanandroid.com/blogimgs/d9a6f718-5011-429c-8dd5-273f02f3bf25.jpeg",
    "isVisible": 1,
    "order": 0,
    "title": "Android高级进阶直播课免费学习",
    "type": 0,
    "url": "https://url.163.com/4bj"
    },
 */

abstract class BannerInterface {
  String get desc;
  int get id;
  String get imagePath;
  int get isVisible;
  int get order;
  String get title;
  int get type;
  String get url;

}

class BannerData implements BannerInterface {
  String desc;
  int id;
  String imagePath ;
  int isVisible ;
  int order ;
  String title;
  int type;
  String url ;


  BannerData({this.id,this.desc, this.imagePath,this.isVisible,this.order,this.title,this.type,this.url});

  factory BannerData.fromJSON(Map json){
    return BannerData(id: json['id'],desc: json['desc'],
    imagePath: json['imagePath'],isVisible: json['isVisible'],
      order: json['order'],
      title: json['title'],
      type: json['type'],
      url: json['url']
    );
  }

  Object toMap() {
    return {'id': id,'desc': desc, 'imagePath': imagePath,'isVisible': isVisible,
      'order': order,'title': title,'type': type,'url': url};
  }

}