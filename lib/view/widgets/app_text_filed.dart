import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


  Widget appTextFiled (
      TextEditingController controller,
      Widget suffixIcon,{
        String labelText=" ",
        bool obscureText=false,
        TextInputType inputType=TextInputType.name
}
      ) {
    return  TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: inputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
          border: const OutlineInputBorder(),
          labelText: labelText),

    );
  }
