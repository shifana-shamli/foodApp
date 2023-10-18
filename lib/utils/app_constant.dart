import 'package:flutter/cupertino.dart';
// images
String logo = 'assets/images/bg.png';

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}
double screenHeight(context) {

  return MediaQuery.of(context).size.height ;
}
// padding size
EdgeInsets commonPaddingAll = const EdgeInsets.all(10);
EdgeInsets commonPaddingAll20 = const EdgeInsets.all(20);
EdgeInsets commonPaddingAll230 = const EdgeInsets.all(30);

//divider (Sized box)

Widget dividerH() {
  return const SizedBox(height: 20);
}

Widget dividerLH() {
  return const SizedBox(height: 10);
}
Widget dividerSH() {
  return const SizedBox(height: 25);

}
Widget dividerSw() {
  return const SizedBox(height: 8);
}
