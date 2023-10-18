
import 'package:flutter/material.dart';

Widget appButton(final Function() onPressedAction ,BuildContext context,
    { String  name = " ",
      Color buttonColor= Colors.greenAccent,
      Color textColor = Colors.black54,
  })
   {
    return ElevatedButton(
      onPressed: onPressedAction,
      style: ElevatedButton.styleFrom(
          primary: buttonColor
      ),
      child: Text(name,style: TextStyle(color: textColor),),

    );
  }

