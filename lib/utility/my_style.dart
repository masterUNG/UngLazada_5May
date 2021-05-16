import 'package:flutter/material.dart';
import 'package:unglazada/utility/my_constant.dart';

class MyStyle {
  MyStyle();

  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
        primary: MyConstant.primary,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      );
}
