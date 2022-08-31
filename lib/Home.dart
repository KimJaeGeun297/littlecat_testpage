import 'dart:html';

import "package:flutter/material.dart";

import 'BaseAppBar.dart';
import 'DrawerWidget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(appBar: AppBar()),
        drawer: const BaseDrawer(drawer: Drawer()),
        body: Center(
          child: const Text(
            "Voucher LittleCat Test Page.",
            style: TextStyle(fontSize: 30),
          ),
        ));
  }
}
