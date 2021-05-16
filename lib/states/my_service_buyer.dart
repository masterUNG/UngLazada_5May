import 'package:flutter/material.dart';
import 'package:unglazada/widgets/show_signout.dart';

class MyServiceBuyer extends StatefulWidget {
  @override
  _MyServiceBuyerState createState() => _MyServiceBuyerState();
}

class _MyServiceBuyerState extends State<MyServiceBuyer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buyer'),
      ),
      drawer: Drawer(
        child: ShowSignOut(),
      ),
    );
  }
}
