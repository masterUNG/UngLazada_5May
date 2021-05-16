import 'package:flutter/material.dart';
import 'package:unglazada/models/user_model.dart';

class CheckType {
  UserModel userModel;

  CheckType({@required this.userModel});

  String byUser() {
    List<String> initialRoutes = [
      '/myServiceBuyer',
      '/myServiceSeller',
      '/myServiceRidder',
    ];

    String type = userModel.type;

    switch (type) {
      case 'buyer':
        return initialRoutes[0];
        break;
      case 'seller':
        return initialRoutes[1];
        break;
      case 'rider':
        return initialRoutes[2];
        break;
      default:
        return initialRoutes[0];
    }
  }
}
