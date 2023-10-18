import 'package:flutter/material.dart';
import 'package:loginpage/utils/app_color.dart';

Widget noInternet (
    BuildContext context,
    String routeName,
    double safeAreaTotal,
    int screenHeadSize,{
      dynamic args,
}){

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/img.png'),
      Container(
            margin: const EdgeInsets.only(top: 20,bottom: 10),
            child: const Text("No  connection",
            style: TextStyle(color: AppColor.black,fontSize: 22),
            ),
          ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: const Text(" check your connection,refresh the page"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.greenAccent
          ),
            onPressed: ()async{

          {Navigator.pop(context);
            Navigator.pushNamed(context, routeName,arguments: args);
  }
  },
            child: const Text("Retry",style: TextStyle(color: Colors.black),))


      ],
    ),
  );

  
}