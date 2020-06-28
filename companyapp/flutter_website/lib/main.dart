import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutterwebsite/loading.dart';
import 'loading.dart';
import 'app.dart';

void main() => runApp(MaterialApp(
  //去掉模拟器右上角的debug水印
  debugShowCheckedModeBanner: false,
  title: 'FLutter企业站',
  //自定义主题
  theme:mDefaultTheme,
  //添加路由
  routes: <String,WidgetBuilder>{
    "app":(BuildContext context)=>App(),
    "company_info":(BuildContext context)=>WebviewScaffold(
      url:"http://www.baidu.com",
      appBar: AppBar(
        title: Text('公司介绍'),
        leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: (){
              //通过这个可以跳转到"app":(BuildContext context)=>App(),指向的页面。即可以从路由到主界面
              Navigator.of(context).pushReplacementNamed('app');


            }),
      ),
    ),

  },
  //指定加载页面，即应用启动时的页面
  home: LoadingPage(),




));
final ThemeData mDefaultTheme=ThemeData(
  primaryColor: Colors.redAccent,

);