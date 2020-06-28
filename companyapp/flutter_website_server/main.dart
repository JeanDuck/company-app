import 'dart:convert';
import 'dart:io';
import 'data.dart';

main() async{
  //这一部分涉及服务器绑定和启动
  //请求服务
  var requestServer=await HttpServer.bind('127.0.0.1',8080);
  print('http服务器启动');

  //处理请求，用await for是因为会有多个请求
  await for(HttpRequest request in requestServer){
     handleMessage(request);
    //tomcat apach+php weblogic node+express


  }

}
void handleMessage(HttpRequest request){

  try{
    if(request.method =='GET'){
      handleGET(request);
      
    }else if(request.method =='POST'){
      //TODO
      handleGET(request);

    }

  }catch(e){
    print('捕获了一个异常: $e');
  }
}
void handleGET(HttpRequest request){
  //处理get请求
  var action=request.uri.queryParameters['action'];
  if(action=='getProducts'){
     var page=request.uri.queryParameters['page'];
     print('第$page页数据:'+json.encode(products));

    print('获取产品数据...');
    request.response
    ..statusCode=HttpStatus.ok
    ..write(json.encode(products))
    ..close();
  }
  else if(action=='getNews'){
    //encode可以对信息进行编码，前端则进行解码和展示
    print('获取新闻数据...');
    request.response
    ..statusCode=HttpStatus.ok
    ..write(json.encode(news))
    ..close();
  }
  else if(action=='contactCompany'){
    var msg=request.uri.queryParameters['msg'];
    print('客户留言为:$msg');
    request.response
    ..statusCode=HttpStatus.ok
    ..write('提交成功:$msg')
    ..close();
  }


  //request.response..write('get request success...')..close();

}
void handlePOST(HttpRequest request){
  //处理post请求
  
}