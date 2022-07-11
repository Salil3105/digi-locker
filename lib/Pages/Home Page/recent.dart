import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

// import Widgets
// import '../../Widgets/Add_pic.dart';

class Recent extends StatefulWidget {
  const Recent({Key? key}) : super(key: key);
  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  //
  Future handelSendToServer() async {
    print('In handelSendToServer');
    var url = 'http://172.25.54.75:5000/uploadFile/uploadMultipleFiles/';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'image/jpeg',
      },
      body: {
        'image': [
          imageFileList != null ? imageFileList![0] : null,
        ],
      },
      
    );
    print(response.body);
  }

  //
  final ImagePicker _picker = ImagePicker();
  List<XFile>? imageFileList = [];
  Future handleImagePicker() async {
    final List<XFile>? selectImages = await _picker.pickMultiImage();
    if (selectImages!.isNotEmpty) {
      imageFileList!.addAll(selectImages);
    }
    print("ImageFile List Length: " + imageFileList!.length.toString());

    setState(() {});
    print("---------------before---------------");
    handelSendToServer();
    print("---------------After---------------");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                height: 500,
                width: double.infinity,
                // decoration: BoxDecoration(
                //   border: Border.all(
                //     color: Colors.green,
                //     width: 2,
                //   ),
                // ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: imageFileList!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.file(File(imageFileList![index].path),
                          fit: BoxFit.cover),
                    );
                  },
                ),
              ),
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Container(
              height: 70,
              width: double.infinity,
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     color: Colors.red,
              //     width: 1,
              //   ),
              // ),
              child: Container(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            handleImagePicker();
                          },
                          tooltip: 'Picked your photos from gallery',
                          child: Icon(Icons.camera),
                        ), // This trailing comma makes auto-formatting nicer for build methods.
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
