import 'package:flutter/material.dart';
import 'home_banner.dart';
import '../services/product.dart';
import '../model/product.dart';
import 'home_product_page.dart';
class HomePage extends StatefulWidget{
  @override
  HomePageState createState()=> HomePageState();
}
class HomePageState extends State<HomePage>{

  ProductListModel listData=ProductListModel([]);
  void getProductList() async{
    var data=await getProductResult();
    ProductListModel list=ProductListModel.fromJson(data);

    setState(() {
      //每查询一次数据，在列表中累加
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState(){
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:ListView(
        children: <Widget>[
          BannerWidget(),
          HomeProductPage(listData),

        ],
      ),
    );
  }


}