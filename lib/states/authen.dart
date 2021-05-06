import 'package:flutter/material.dart';
import 'package:unglazada/utility/dialog.dart';
import 'package:unglazada/utility/my_constant.dart';
import 'package:unglazada/widgets/show_image.dart';
import 'package:unglazada/widgets/show_title.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  double size;
  String email, password;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildImage(),
              buildUser(),
              buildPassword(),
              buildLogin(),
              builCreateAccount(context),
            ],
          ),
        ),
      ),
    );
  }

  Row builCreateAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(title: 'Non Account ? ', indexStyle: 2),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/createAccount'),
          child: ShowTitle(title: 'Create Account', indexStyle: 3),
        ),
      ],
    );
  }

  Container buildLogin() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: size * 0.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: MyConstant.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          if ((email?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            normalDialog(context, 'มีช่องว่าง !!!', 'กรุณากรอกทุกช่อง คะ ');
          } else {}
        },
        child: Text('Login'),
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
        obscureText: true,
        style: TextStyle(color: MyConstant.dart),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyConstant.primary),
          hintText: 'Password :',
          prefixIcon: Icon(
            Icons.lock_outline,
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

  Container buildImage() {
    return Container(
      width: size * 0.6,
      child: ShowImage(path: MyConstant.authen),
    );
  }
}
