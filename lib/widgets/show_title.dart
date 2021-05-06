import 'package:flutter/material.dart';
import 'package:unglazada/utility/my_constant.dart';

class ShowTitle extends StatelessWidget {
  String title;
  int indexStyle;

  ShowTitle({@required this.title, @required this.indexStyle});

  TextStyle h1Style() => TextStyle(
        color: MyConstant.dart,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => TextStyle(
        color: MyConstant.dart,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );

  TextStyle h3Style() => TextStyle(
        color: MyConstant.dart,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      );

  TextStyle h3ButtonStyle() => TextStyle(
        color: Colors.pink[700],
        fontSize: 14,
        fontWeight: FontWeight.w700,
      );

  @override
  Widget build(BuildContext context) {
    List<TextStyle> textStyles = [h1Style(), h2Style(), h3Style(), h3ButtonStyle(),];
    return Text(title, style: textStyles[indexStyle],);
  }
}
