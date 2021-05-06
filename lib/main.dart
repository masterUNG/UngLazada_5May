import 'package:flutter/material.dart';
import 'package:unglazada/states/authen.dart';
import 'package:unglazada/states/create_account.dart';
import 'package:unglazada/states/my_service_buyer.dart';
import 'package:unglazada/states/my_service_seller.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/myServiceBuyer': (BuildContext context) => MyServiceBuyer(),
  '/myServiceSeller': (BuildContext context) => MyServiceSeller(),
  '/myServiceRidder': (BuildContext context) => MyServiceSeller(),
};

String initialRount;

void main() {
  initialRount = '/authen';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: initialRount,
    );
  }
}
