import 'package:flutter/material.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget{
  @override
  _LoadingState createState()=> _LoadingState();
}
class  _LoadingState extends State<LoadingPage>{
  @override
  void initState(){
    super.initState();
    //在加载页面停顿3秒
    Future.delayed(Duration(seconds: 3),(){
      print("Ducky&Piggy企业站启动...");
      Navigator.of(context).pushReplacementNamed("app");

    });
  }
  @override
  Widget build(BuildContext context){
    //pageView ,可以通过这种方式加广告，将页面不断划，划到最后显示
    return Center(
      child: Center(
        //stack是一种层叠组件，在这里用一个背景层和一个文本层
        child: Stack(
          children: <Widget>[
            //用asset方式添加image元素,加载页面背景图
            Image.asset(
                'assets/images/loading.jpeg'
            ),
            Center(
              child: Text(
                'Ducky&Piggy企业站',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36.0,
                  decoration: TextDecoration.none
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}