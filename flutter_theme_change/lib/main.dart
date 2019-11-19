import 'package:flutter/material.dart';
import 'package:flutter_theme_change/model/profile_change_notifier.dart';
import 'package:flutter_theme_change/provider/ChangeNotifierProvider.dart';
import 'package:flutter_theme_change/provider/Consumer.dart';
import 'package:flutter_theme_change/sp/shared_preferences_keys.dart';
import 'package:flutter_theme_change/widget/single_theme_color.dart';
import 'sp/shared_preferences.dart';

const List<Map<String, dynamic>> defalutThemeColor = [
  {'cnName': 'Flutter蓝', 'value': 0xFF3391EA},
  {'cnName': '姨妈红', 'value': 0xFFC91B3A},
  {'cnName': '橘子橙', 'value': 0xFFF7852A},
  {'cnName': '骚烈黄', 'value': 0xFFFFC800},
  {'cnName': '早苗绿', 'value': 0xFFC0FF3E},
  {'cnName': '基佬紫', 'value': 0xFFBF3EFF},
  {'cnName': '少女粉', 'value': 0xFFFF6EB4},
  {'cnName': '淡雅灰', 'value': 0xFF949494},
];

SpUtil sp;

void main() async{
  sp = await SpUtil.getInstance();
  return  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int themeColor =0;
  
  @override
  void initState() {
    super.initState();
    themeColor = sp.getInt(SharedPreferencesKeys.themeColor);
    if(themeColor == null ){
      themeColor = 0xFF3391EA;//默认蓝色
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider<ThemeModel>(
        data: ThemeModel(themeColor),
        child: Consumer<ThemeModel>(
          builder: (BuildContext context,themeModel){
            return MaterialApp(
              theme: ThemeData(
                primaryColor: Color(themeModel.settingThemeColor),
              ),
              home: Scaffold(
                  appBar: AppBar(
                    title: Text("Flutter Theme Change"),
                    actions: <Widget>[
                      Builder(builder: (context){
                        return IconButton(icon: new Icon(Icons.color_lens), onPressed: (){
                          _changeColor(context);
                        });
                      },)
                      // onPressed 点击事件
                    ],
                  ),
                  body: Center(
                    child: Text("主题变化测试"),
                  )
              ),
            );
          },
        ),
      ),
    );
  }

  void _changeColor(BuildContext context) {
      buildSimpleDialog(context);
  }

  Future<Dialog> buildSimpleDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return Dialog(
            child: Container(
              //symmetric({ vertical, horizontal })：用于设置对称方向的填
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              height: 300,
              color: Colors.white,
              child: Wrap(
                // 扩展方式，横向堆砌
                  direction: Axis.horizontal,
                  // 对齐方式
                  alignment: WrapAlignment.center,
                  // 主轴空隙间距
                  spacing: 0,
                  // run的对齐方式 开始位置
                  runAlignment: WrapAlignment.start,
                  // run空隙间距
                  runSpacing: 10,
                  // 交叉轴对齐方式
                  crossAxisAlignment: WrapCrossAlignment.end,
                  // 文本对齐方向
                  textDirection: TextDirection.ltr,
                  // 确定垂直放置子元素的顺序，以及如何在垂直方向上解释开始和结束。 默认down
                  verticalDirection: VerticalDirection.down,
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                //mainAxisSize: MainAxisSize.max,//表示尽可能多的占用水平方向的空间，此时无论子widgets实际占用多少水平空间，Row的宽度始终等于水平方向的最大宽度
                children: buildThemeColorChildren(),
              ),
            ),
          );
        }
    );
  }

  List<Widget> buildThemeColorChildren() {
    List<Widget> colorChildList =  new List<Widget>();
    for(int i = 0; i< defalutThemeColor.length;i++){
      colorChildList.add(SingleThemeColor(
        colorName: defalutThemeColor[i]['cnName'],
        themeColor: defalutThemeColor[i]['value'],
      ));
    }
    return colorChildList;
  }
}
