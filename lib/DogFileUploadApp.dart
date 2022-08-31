import 'dart:html';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:littlecat_testpage/BaseAppBar.dart';
import 'package:littlecat_testpage/DrawerWidget.dart';

class DogUploadPage extends StatefulWidget {
  const DogUploadPage({Key? key}) : super(key: key);

  @override
  State<DogUploadPage> createState() => _DogUploadPageState();
}

class _DogUploadPageState extends State<DogUploadPage> {
  String optionText = "Initialized text option";
  Uint8List? uploadedImage;
  FileUploadInputElement element = FileUploadInputElement()..id = "file_input";
  FileReader reader = new FileReader();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), //BaseAppBar(appBar: AppBar()),
        //drawer: const BaseDrawer(drawer: Drawer()),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: const Text("일반사진 (강아지)", style: TextStyle(fontSize: 30)),
            ),
            Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
                  Container(
                      child: Column(
                    children: <Widget>[
                      Container(
                        child: const Text("분석 전"),
                      ),
                      InkWell(
                          onTap: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles(allowMultiple: false);
                            if (result != null) {
                              setState(() {
                                uploadedImage = result.files.single.bytes;
                              });
                            }
                          },
                          child: uploadedImage == null
                              ? Ink(
                                  height: 500,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      border: Border.all(
                                        color: Colors.blueGrey,
                                        width: 1,
                                      )),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 20, bottom: 20),
                                    child: const Text("탭하여 파일을 업로드 하세요"),
                                  ),
                                )
                              : Ink(
                                  height: 500,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      border: Border.all(
                                        color: Colors.blueGrey,
                                        width: 1,
                                      )),
                                  child: Image.memory(uploadedImage!))),
                    ],
                  )),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.keyboard_arrow_right),
                        ),
                        Container(
                          child: const Text("분석하기"),
                        )
                      ],
                    ),
                  ),
                  Container(
                      child: Column(
                    children: <Widget>[
                      Container(
                        child: const Text("분석 후"),
                      ),
                      Container(
                        height: 500,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.only(
                            left: 10, top: 20, bottom: 20),
                        child: const Text(""),
                      ),
                    ],
                  ))
                ]),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 30, right: 10),
                    child: ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(allowMultiple: false);
                          if (result != null) {
                            setState(() {
                              uploadedImage = result.files.single.bytes;
                            });
                          }
                        },
                        child: const Text('file Upload'))),
                Container(
                  padding: EdgeInsets.only(top: 30, left: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          uploadedImage = null;
                        });
                      },
                      child: Row(children: [
                        Icon(Icons.restart_alt),
                        SizedBox(width: 5.0),
                        const Text("RESET"),
                      ])),
                )
              ],
            )
          ],
        )));
  }
}
