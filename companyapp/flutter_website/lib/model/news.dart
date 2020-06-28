//新闻列表数据转换
class NewsItemModel {
  String author; //作者
  String title; //新闻标题
  String content; //内容

  NewsItemModel({
    this.author,
    this.title,
    this.content,
  });
  factory NewsItemModel.fromJson(dynamic json) {
    return NewsItemModel(
      author: json['author'],
      title: json['title'],
      content: json['content'],
    );
  }
}

//产品列表数据转换
class NewsListModel {
  List<NewsItemModel> data;
  NewsListModel(this.data);

  //这里的list json数据就是service/news.dart中返回的数据，传进去后，用map方式迭代
  factory NewsListModel.fromJson(List json) {
    return NewsListModel(
        //利用ProductItemModel.fromJson((i))).toList()，将获得的Json数据转化为一个个NewsItemModel，再将NewsItemModel组装成NewsListModel
        json.map((i) => NewsItemModel.fromJson((i))).toList());
  }
}
