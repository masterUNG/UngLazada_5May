import 'package:flutter/material.dart';
import 'package:unglazada/widgets/show_signout.dart';

class MyServiceRidder extends StatefulWidget {
  @override
  _MyServiceRidderState createState() => _MyServiceRidderState();
}

class _MyServiceRidderState extends State<MyServiceRidder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rider'),
      ),drawer: Drawer(child: ShowSignOut(),),
    );
  }
}
