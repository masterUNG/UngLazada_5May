import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unglazada/models/user_model.dart';
import 'package:unglazada/utility/dialog.dart';
import 'package:unglazada/utility/my_constant.dart';
import 'package:unglazada/widgets/show_image.dart';
import 'package:unglazada/widgets/show_title.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  double size;
  String type, name, email, password;

  Container buildCreateAccount() {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 64),
      width: size * 0.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: MyConstant.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          if ((name?.isEmpty ?? true) ||
              (email?.isEmpty ?? true) ||
              (password?.isEmpty ?? true)) {
            normalDialog(context, 'Have Space !!!', 'Please Fill Every Blank');
          } else if (type == null) {
            normalDialog(context, 'No Type ?', 'Please Choose Type');
          } else {
            processCreateAccount();
          }
        },
        child: Text('Create Account'),
      ),
    );
  }

  Future<Null> processCreateAccount() async {
    await Firebase.initializeApp().then((value) async {
      print('### InitialApp Success ####');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await value.user.updateProfile(displayName: name);

        String uid = value.user.uid;
        print('### Create Account Success uid = $uid ###');

        UserModel model = UserModel(name: name, password: password, type: type);

        await FirebaseFirestore.instance
            .collection('user')
            .doc(uid)
            .set(model.toMap())
            .then((value) => Navigator.pop(context));
      }).catchError((onError) =>
              normalDialog(context, onError.code, onError.message));
    });
  }

  Container buildName() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: size * 0.6,
      child: TextField(
        onChanged: (value) => name = value.trim(),
        style: TextStyle(color: MyConstant.dart),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyConstant.primary),
          hintText: 'Name :',
          prefixIcon: Icon(
            Icons.perm_identity,
            color: MyConstant.primary,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: MyConstant.dart),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: MyConstant.light),
          ),
        ),
      ),
    );
  }

  Container buildUser() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: size * 0.6,
      child: TextField(
        onChanged: (value) => email = value.trim(),
        style: TextStyle(color: MyConstant.dart),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyConstant.primary),
          hintText: 'Email :',
          prefixIcon: Icon(
            Icons.email_outlined,
            color: MyConstant.primary,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: MyConstant.dart),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: MyConstant.light),
          ),
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: size * 0.6,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        style: TextStyle(color: MyConstant.dart),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyConstant.primary),
          hintText: 'Password :',
          prefixIcon: Icon(
            Icons.lock_outlined,
            color: MyConstant.primary,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: MyConstant.dart),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: MyConstant.light),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        title: Text('Create Account'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildImage(),
              buildName(),
              buildType(),
              buildUser(),
              buildPassword(),
              buildCreateAccount(),
            ],
          ),
        ),
      ),
    );
  }

  Container buildType() {
    return Container(
      width: size * 0.6,
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowTitle(title: 'Type :', indexStyle: 1),
          RadioListTile(
            value: 'buyer',
            groupValue: type,
            onChanged: (value) {
              setState(() {
                type = value;
              });
            },
            title: ShowTitle(title: 'Buyer', indexStyle: 2),
          ),
          RadioListTile(
            value: 'seller',
            groupValue: type,
            onChanged: (value) {
              setState(() {
                type = value;
              });
            },
            title: ShowTitle(title: 'Seller', indexStyle: 2),
          ),
          RadioListTile(
            value: 'rider',
            groupValue: type,
            onChanged: (value) {
              setState(() {
                type = value;
              });
            },
            title: ShowTitle(title: 'Rider', indexStyle: 2),
          ),
        ],
      ),
    );
  }

  Container buildImage() {
    return Container(
      width: size * 0.6,
      child: ShowImage(path: MyConstant.account),
    );
  }
}
