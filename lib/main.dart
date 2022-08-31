import 'package:flutter/material.dart';
import 'package:littlecat_testpage/CatFileUploadApp.dart';

import 'Home.dart';

void main() => runApp(const TestPage());

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "리틀캣 테스트페이지",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true),
      home: const Home(),
    );
  }
}
