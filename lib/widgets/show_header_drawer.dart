import 'package:flutter/material.dart';
import 'package:unglazada/utility/my_constant.dart';
import 'package:unglazada/widgets/show_image.dart';

class ShowHeaderDrawer extends StatelessWidget {
  String name, type;

  ShowHeaderDrawer({@required this.name, @required this.type});

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      currentAccountPicture: ShowImage(path: MyConstant.authen),
      accountName: Text(name),
      accountEmail: Text(type),
    );
  }
}
