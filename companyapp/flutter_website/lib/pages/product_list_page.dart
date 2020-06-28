import 'package:flutter/material.dart';
import '../model/product.dart';
import '../services/product.dart';
import '../style/index.dart';
import 'product_detail_page.dart';

class ProductResultListWidget extends StatelessWidget {
  //列表数据
  final ProductListModel list;
  //获取下一页
  final VoidCallback getNextPage;

  ProductResultListWidget(this.list, {this.getNextPage});

  @override
  Widget build(BuildContext context) {
    //如果list.data.length==0执行冒号面前的，否则执行冒号后的
    return list.data.length == 0
        ? Center(
            //圆形进度条
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            //指定水平方向的边距
            padding: EdgeInsets.symmetric(horizontal: 10),
            //列表项数
            itemCount: list.data.length,
            //列表项构建
            itemBuilder: (BuildContext context, int i) {
              //列表第i条数据
              ProductItemModel item = list.data[i];
              //加载一页,每当滚动条到达页面最下面，就加载一次数据
              if ((i + 4) == list.data.length) {
                getNextPage();
              }
              //实现产品列表产品的点击
              return GestureDetector(
                //实现产品列表产品的点击
                onTap: () {
                  //点击产品列表中的项，跳转到productdetail，产品信息详细界面
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetail(item: item)),
                  );
                },
                //列表项背景
                child: Container(
                  color: ProductColors.bgColor,
                  padding: EdgeInsets.only(
                    top: 5.0,
                    right: 5.0,
                  ),
                  //做一个水平布局
                  child: Row(
                    children: <Widget>[
                      //产品图片
                      Image.asset(
                        item.imageUrl,
                        width: 120.0,
                        height: 120.0,
                      ),
                      //设置产品描述部分的信息和图片之间的距离
                      SizedBox(
                        width: 10,
                      ),
                      //保证界面不溢出，设置边框，分割线
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            width: 1,
                            color: ProductColors.divideLineColor,
                          ))),
                          //产品描述垂直布局
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                item.desc,
                                //最多两行
                                maxLines: 2,
                                //数据多了，用点表示
                                overflow: TextOverflow.ellipsis,
                              ),
                              //item.type和point标记处，水平布局
                              Row(
                                children: <Widget>[
                                  //五个间隙
                                  SizedBox(
                                    width: 5,
                                  ),
                                  //产品类型
                                  Text(
                                    item.type,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: ProductColors.typeColor,
                                    ),
                                  ),
                                  //产品特点
                                  item.point == null
                                      ? SizedBox()
                                      : Container(
                                          child: Text(
                                            item.point,
                                            style: TextStyle(
                                              color: ProductColors.pointColor,
                                            ),
                                          ),
                                          //内边距，即边框内的文字和边框的距离
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3),
                                          //外边距，即边框和type的距离
                                          margin: EdgeInsets.only(left: 4),
                                          //是给point指标加上框框
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: ProductColors
                                                      .pointColor)),
                                        )
                                ],
                              ),
                              //产品描述的字体颜色
                              Text(
                                item.name,
                                style: ProductFonts.itemNameStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
  }
}
