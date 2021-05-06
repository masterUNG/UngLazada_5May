import 'package:flutter/material.dart';
import 'package:unglazada/utility/my_constant.dart';
import 'package:unglazada/widgets/show_image.dart';
import 'package:unglazada/widgets/show_title.dart';

Future<Null> normalDialog(
    BuildContext context, String title, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: ShowImage(path: MyConstant.account),
        title: ShowTitle(title: title, indexStyle: 1),
        subtitle: ShowTitle(title: message, indexStyle: 2),
      ),
      children: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: ShowTitle(title: 'OK', indexStyle: 3))
      ],
    ),
  );
}
