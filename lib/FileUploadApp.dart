import 'dart:html';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String optionText = "Initialized text option";
  Uint8List? uploadedImage;
  FileUploadInputElement element = FileUploadInputElement()..id = "file_input";
  FileReader reader = new FileReader();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LittleCat'),
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: const Text("Loving Cat"),
                accountEmail: const Text("aaa@aaa.aaa")),
          ],
        )),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: const Text("일반사진 (고양이)"),
            ),
            Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(children: <Widget>[
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
                                  border: Border.all(
                                color: Colors.blueGrey,
                                width: 1,
                              )),
                              child:
                                  const Text("uploaded image should show here"),
                            )
                          : Ink(
                              height: 500,
                              width: 300,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.blueGrey,
                                width: 1,
                              )),
                              child: Image.memory(uploadedImage!))),
                  Container(
                      child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_arrow_right),
                  )),
                  Container(
                    height: 500,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    padding:
                        const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                    child: const Text("변환 후"),
                  ),
                ]),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 30, right: 10),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('test'))),
                Container(
                    padding: EdgeInsets.only(top: 30, left: 10),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('test'))),
              ],
            )
          ],
        )));
  }
}
