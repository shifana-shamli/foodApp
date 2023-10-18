import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loginpage/utils/app_color.dart';
import 'package:loginpage/utils/app_constant.dart';
import 'package:loginpage/utils/app_sp.dart';
import 'package:loginpage/view/pages/home/homepage.dart';

import '../login/loginpage.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future isLogged = AppSp().getIsLogged();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      bool val = await AppSp().getIsLogged();
      if (val) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greenAccent,
      body: Center(
        child: Image.asset(
          logo,
          height: 172,
          width: 172,
        ),
      ),
    );
  }
}


