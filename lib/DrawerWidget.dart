import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:littlecat_testpage/CloseCatFileUploadApp.dart';
import 'package:littlecat_testpage/DermatosisUploadApp.dart';
import 'package:littlecat_testpage/DogFileUploadApp.dart';

import 'CatFileUploadApp.dart';
import 'DogFileUploadApp.dart';

class BaseDrawer extends StatelessWidget {
  final Drawer? drawer;
  const BaseDrawer({Key? key, @required this.drawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
              accountName: Text("Tmax"), accountEmail: Text("aaa@aaa.aaa")),
          ExpansionTile(
            title: const Text("안구질병 분석"),
            children: [
              ListTile(
                  title: Row(children: [
                    Icon(Icons.subdirectory_arrow_right),
                    ExpansionTile(
                      title: const Text("일반사진"),
                      children: [
                        ListTile(
                            title: Row(children: [
                              Icon(Icons.subdirectory_arrow_right),
                              Container(
                                child: const Text("고양이"),
                              )
                            ]),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CatUploadPage()));
                            }),
                        ListTile(
                            title: Row(children: [
                              Icon(Icons.subdirectory_arrow_right),
                              Container(
                                child: const Text("강아지"),
                              )
                            ]),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DogUploadPage()));
                            }),
                      ],
                    ),
                    ExpansionTile(
                      title: const Text("근접 사진"),
                      children: [
                        ListTile(
                            title: Row(children: [
                              Icon(Icons.subdirectory_arrow_right),
                              Container(
                                child: const Text("고양이"),
                              )
                            ]),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CloseCatFileUpload()));
                            }),
                        ListTile(
                            title: Row(children: [
                              Icon(Icons.subdirectory_arrow_right),
                              Container(
                                child: const Text("강아지"),
                              )
                            ]),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DogUploadPage()));
                            }),
                      ],
                    )
                    // Container(
                    //   child: const Text("고양이"),
                    // )
                  ]),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CatUploadPage()));
                  }),
            ],
          ),
          ListTile(
            title: const Text('피부질병 분석'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const DermatosisUploadPage())));
            },
          ),
        ],
      ),
    );
  }
}
