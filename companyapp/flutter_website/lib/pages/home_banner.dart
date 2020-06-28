import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerWidget extends StatelessWidget{
  //图片路径
  List<String> banners=<String>[
    'assets/images/banners/1.jpeg',
    'assets/images/banners/2.jpeg',
    'assets/images/banners/3.jpeg',
    'assets/images/banners/4.jpeg',
  ];
  @override
  Widget build(BuildContext context){
    //获得当前widget上下文环境的宽度
   double width=MediaQuery.of(context).size.width;
   //根据宽度计算高度，保证比例不失真
   double height=width*540.0/1080.0;
   return Container(
     width: width,
     height: height,
     //轮播组件
     child: Swiper(
       //利用itembuilder构建轮播组建
       itemBuilder: (BuildContext context,index){
         return Container(
           //图片左右内边距
           margin: EdgeInsets.only(left: 5,right: 5),
           child: Image.asset(
             banners[index],
             width: width,
             height: height,
             //FIT是图片填充模式
             fit: BoxFit.cover,

           ),
         );
       },
       //轮播数量
       itemCount: banners.length,
       //划动方式--水平的划动
       scrollDirection: Axis.horizontal,
       //是否自动播放
       autoplay: true,
     ),
   );
  }

}
