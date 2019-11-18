import 'package:flutter/material.dart';
import 'package:flutter_theme_change/model/profile_change_notifier.dart';
import 'package:flutter_theme_change/provider/ChangeNotifierProvider.dart';
import 'package:flutter_theme_change/provider/Consumer.dart';
import 'package:flutter_theme_change/widget/single_theme_color.dart';

const List<Map<String, dynamic>> defalutThemeColor = [
  {'cnName': 'Flutter蓝', 'value': 0xFF3391EA},
  {'cnName': '姨妈红', 'value': 0xFFC91B3A},
  {'cnName': '橘子橙', 'value': 0xFFF7852A},
  {'cnName': '骚烈黄', 'value': 0xFFFFC800},
  {'cnName': '早苗绿', 'value': 0xFFC0FF3E},
  {'cnName': '基佬紫', 'value': 0xFFBF3EFF},
];

void main() => runApp(MyApp());

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider<ThemeModel>(
        data: ThemeModel(0xFF3391EA), //默认蓝色
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
                spacing: 5, //主轴上子控件的间距
                runSpacing: 5, //交叉轴上子控件之间的间距
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
