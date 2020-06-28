import 'package:flutter/material.dart';
import '../model/product.dart';
import '../utils/utils.dart';

class ProductDetail extends StatelessWidget{
  final ProductItemModel item;
  ProductDetail({Key key,@required this.item}):super(key:key);






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            item.imageUrl,
            //cover模式是整体覆盖
            fit: BoxFit.cover,

          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(item.desc),
          ),
        ],
      ),
    );
  }
}