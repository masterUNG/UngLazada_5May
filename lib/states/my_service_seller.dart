import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unglazada/models/user_model.dart';
import 'package:unglazada/utility/my_service.dart';
import 'package:unglazada/widgets/show_header_drawer.dart';
import 'package:unglazada/widgets/show_signout.dart';

class MyServiceSeller extends StatefulWidget {
  @override
  _MyServiceSellerState createState() => _MyServiceSellerState();
}

class _MyServiceSellerState extends State<MyServiceSeller> {
  UserModel userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) async {
        await FirebaseFirestore.instance
            .collection('user')
            .doc(event.uid)
            .snapshots()
            .listen((event) {
          setState(() {
            userModel = UserModel.fromMap(event.data());
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller'),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            ShowSignOut(),
            ShowHeaderDrawer(
              name: userModel == null ? 'Name' : userModel.name,
              type: userModel == null ? 'Type' : userModel.type,
            ),
          ],
        ),
      ),
    );
  }
}
