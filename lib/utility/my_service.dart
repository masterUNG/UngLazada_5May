import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:unglazada/models/user_model.dart';

class MyService {
  MyService();

  Future<UserModel> findUser() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) async {
        await FirebaseFirestore.instance
            .collection('user')
            .doc(event.uid)
            .snapshots()
            .listen((event) {
          UserModel model = UserModel.fromMap(event.data());

          return model;
        });
      });
    });
  }
}
