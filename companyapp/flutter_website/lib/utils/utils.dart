
import 'package:flutter/material.dart';
//颜色转换工具

Color string2Color(String colorString){
  int value=0x00000000;
  if(isNotEmpty(colorString)){
    //先判断第一位数字是否是#
    if(colorString[0]=='#'){
      //取第一位数字（从0开始）
      colorString=colorString.substring(1);
    }
    //转换成int型

    value=int.tryParse(colorString,radix: 16);
    if(value!=null){
      if(value<0xFF000000){
        value+=0xFF000000;
      }
    }
  }
  return Color(value);
}

bool isNotEmpty(String colorString) {
  return colorString.isNotEmpty;
}