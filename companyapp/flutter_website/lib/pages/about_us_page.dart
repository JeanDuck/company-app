import 'package:flutter/material.dart';
import 'about_contact_page.dart';

class AboutUsPage extends StatefulWidget{
  @override
  AboutUsPageState createState()=> AboutUsPageState();
}
class AboutUsPageState extends State<AboutUsPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/company.jpeg',
              //填充模式
              fit: BoxFit.cover,
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('公司介绍'),
              onTap: (){
                //跳转到公司网站界面
                Navigator.of(context).pushReplacementNamed('company_info');
              },
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('公司优势'),
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),

            ListTile(
              leading: Icon(Icons.phone),
              title: Text('联系我们'),
              onTap: (){
                //跳转到留言界面
                Navigator.push(context,MaterialPageRoute(builder: (context)=>AboutContactPage()));
              },
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),



          ],
        ),
      ),
    );
  }


}