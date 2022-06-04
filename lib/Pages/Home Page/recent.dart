import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

// import Widgets
// import '../../Widgets/Add_pic.dart';

class Recent extends StatefulWidget {
  const Recent({Key? key}) : super(key: key);
  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {

  final ImagePicker _picker = ImagePicker();
  List<XFile>? imageFileList = [];
  void selectedImages() async {
    final List<XFile>? selectImages = await _picker.pickMultiImage();
    if (selectImages!.isNotEmpty) {
      imageFileList!.addAll(selectImages);
    }
    print("ImageFile List Length: " + imageFileList!.length.toString());
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              height: 580,
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
          SizedBox(
            height: 5,
          ),
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
                  padding: EdgeInsets.fromLTRB(5, 5, 15, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          selectedImages();
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
    );
  }
}


