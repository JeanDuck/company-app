import 'package:flutter/material.dart';
import '../model/news.dart';
import '../services/news.dart';
import 'News_detail_page.dart';

//新闻页面
class NewsPage extends StatefulWidget {
  @override
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  NewsListModel listData = NewsListModel([]);

  //获取新闻列表数据
  void getNewsList() async {
    //从后端获得数据
    var data = await getNewsResult();
    //解析得到数据
    NewsListModel list = NewsListModel.fromJson(data);

    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    getNewsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //带分割线的list
      body: ListView.separated(
        //滚动方向为垂直方向
        scrollDirection: Axis.vertical,
        //分割线构造器：设置分割线的颜色和宽度
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 1.0,
          color: Colors.grey,
        ),
        itemCount: listData.data.length,
        //列表项构建器，index是列表中的第index项，点击相应项，可以从listdata中获得相应数据
        itemBuilder: (BuildContext context, int index) {
          //新闻列表项数据
          NewsItemModel item = listData.data[index];

          return ListTile(
              title: Text(item.title),
              subtitle: Text(item.content),
              //标题前加入新闻图标
              leading: Icon(Icons.fiber_new),
              //标题后加入箭头
              trailing: Icon(Icons.arrow_forward),
              //上下左右间隙
              contentPadding: EdgeInsets.all(10.0),
              //是否可用
              enabled: true,
              //跳转到新闻详情页面
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewsDetailPage(item: item)),
                );
              });
        },
      ),
    );
  }
}
