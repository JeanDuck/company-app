import 'package:flutter/material.dart';
import '../model/product.dart';
import '../services/product.dart';
import 'product_list_page.dart';

class ProductPage extends StatefulWidget{
  @override
  ProductPageState createState()=> ProductPageState();
}
class  ProductPageState extends State<ProductPage>{

  ProductListModel listData=ProductListModel([]);
  //用page作翻页效果
  int page=0;
  //获取产品列表数据，要import services/product.dart，同时回调使用
  void getProductList() async{
    var data=await getProductResult(page++);
    ProductListModel list=ProductListModel.fromJson(data);

    setState(() {
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
    // ProductResultListWidget是product_list_page中的类，getNextPage回调使用getProductResult()，
    // 也就是说，每次划动到页面底部时，都用回调getNextPage: ()再加载数据
    return ProductResultListWidget(listData,getNextPage: ()=>getProductList(),);
  }


}