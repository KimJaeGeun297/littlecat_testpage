import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CatUploadPage extends StatefulWidget {
  const CatUploadPage({Key? key}) : super(key: key);

  @override
  State<CatUploadPage> createState() => _CatUploadPageState();
}

class _CatUploadPageState extends State<CatUploadPage> {
  String optionText = "Initialized text option";
  Uint8List? uploadedImage;
  Uint8List? responseImage;
  FilePickerResult? sendresult;
  late String responseResult;
  static const jsonString = '{"mode": "N", "type": "C"}';
  final url = 'http://192.168.157.31:8090/littlecat-api/v1/testpage';
  final sendjson = jsonEncode(jsonString);

  PostFile() async {
    if (sendresult != null) {
      final formData = FormData.fromMap({
        'multipartFile':
            await MultipartFile.fromBytes(uploadedImage!, filename: "test.jpg"),
        'json': jsonString
      });
      print(sendjson);
      var dio = new Dio();
      try {
        var response = await dio.post(
          url,
          data: formData,
        );
        Map<String, dynamic> result = jsonDecode(response.data);
        setState(() {
          responseImage =
              base64Decode(result.values.first['eye_detection_image']);
          responseResult = result['targets'][2]['result'].toString();
        });
      } catch (eee) {
        print(eee.toString());
      }
    }
  }

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
              child: const Text("고양이사진", style: TextStyle(fontSize: 30)),
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
                          customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          onTap: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles(allowMultiple: false);
                            if (result != null) {
                              setState(() {
                                uploadedImage = result.files.single.bytes;
                                sendresult = result;
                              });
                            }
                          },
                          child: uploadedImage == null
                              ? Ink(
                                  height: 500,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
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
                                      borderRadius: BorderRadius.circular(15.0),
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
                          onPressed: () {
                            PostFile();
                          },
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
                          height: 600,
                          width: 700,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: responseImage == null
                              ? null
                              : Column(
                                  children: [
                                    Container(
                                        height: 570,
                                        width: 700,
                                        child: Image.memory(responseImage!)),
                                    Container(child: Text(responseResult))
                                  ],
                                )
                          //,
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
                          responseImage = null;
                          responseResult = "";
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
