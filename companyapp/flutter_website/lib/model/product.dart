//产品列表项数据转换
class ProductItemModel{
  String desc;//产品描述
  String type;//产品类型
  String name;
  String imageUrl;//产品图片路径
  String point;

  ProductItemModel({
    this.desc,
    this.type,
    this.name,
    this.imageUrl,
    this.point

});
  factory ProductItemModel.fromJson(dynamic json){
    return ProductItemModel(
      desc: json['desc'],
      type: json['type'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      point: json['point'],

    );
  }




}
//产品列表数据转换
class ProductListModel{

  List<ProductItemModel> data;
  //在ProductListModel中加入ProductItemModel的list
  ProductListModel(this.data);

  //这里的list json数据就是service/product.dart中返回的数据，传进去后，用map方式迭代
  factory ProductListModel.fromJson(List json){
    return ProductListModel(
      //利用ProductItemModel.fromJson((i))).toList()，将获得的Json数据转化为一个个ProductItemModel，再将ProductItemModel组装成ProductListModel
      json.map((i)=>ProductItemModel.fromJson((i))).toList()
    );
  }


}