import 'package:flutter/cupertino.dart';

import '../view/pages/cart/cartpage.dart';
import '../view/pages/home/homepage.dart';
import '../view/pages/login/loginpage.dart';
import '../view/pages/splash/splash_page.dart';

Route onGenerateRoute(RouteSettings settings) {
  Route page = CupertinoPageRoute(
    builder: (context) => SplashPage(),
  );
  switch (settings.name) {
    case "/splash":
      page = CupertinoPageRoute(
        builder: (context) =>  SplashPage(),
      );
      break;
    case "/login":
      page = CupertinoPageRoute(
        builder: (context) => LoginPage(),
      );
      break;
    case "/home":
      page = CupertinoPageRoute(
        builder: (context) =>   HomePage(),
      );
      break;
    case "/cart":
      page = CupertinoPageRoute(
        builder: (context) =>    CartPage (),
      );
  }
  return page;
}
