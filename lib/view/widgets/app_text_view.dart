
  import 'package:flutter/cupertino.dart';
import 'package:loginpage/utils/app_color.dart';

Widget appTextView( {
    String name = '',
  Color textColor = AppColor.black,
  double fontSize =14,

  })
{
  return Text(name,style:  TextStyle(color: AppColor.black,fontSize:fontSize ),);
}

