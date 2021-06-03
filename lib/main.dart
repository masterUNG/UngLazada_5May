import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unglazada/models/user_model.dart';
import 'package:unglazada/states/authen.dart';
import 'package:unglazada/states/create_account.dart';
import 'package:unglazada/states/my_service_buyer.dart';
import 'package:unglazada/states/my_service_ridder.dart';
import 'package:unglazada/states/my_service_seller.dart';
import 'package:unglazada/utility/checkType.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/myServiceBuyer': (BuildContext context) => MyServiceBuyer(),
  '/myServiceSeller': (BuildContext context) => MyServiceSeller(),
  '/myServiceRidder': (BuildContext context) => MyServiceRidder(),
};

String initialRount;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      if (event == null) {
        initialRount = '/authen';
        runApp(MyApp());
      } else {
        await FirebaseFirestore.instance
            .collection('user')
            .doc(event.uid)
            .snapshots()
            .listen((event) {
          UserModel model = UserModel.fromMap(event.data());
          initialRount = CheckType(userModel: model).byUser();
          runApp(MyApp());
        });
      }
    });
  }).catchError((e) => print('###### ${e.toString()}'));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: initialRount,
      title: 'Ung Lazada',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }
}
