import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddPic extends StatefulWidget {
  const AddPic({Key? key}) : super(key: key);
  @override
  State<AddPic> createState() => _AddPicState();
}

class _AddPicState extends State<AddPic> {
  void getImageFromGallery() async {
    XFile _image;
    XFile ? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  // bottomsheets(context);
                  getImageFromGallery();
                },
                tooltip: 'Picked your photos from gallery',
                child: Icon(Icons.camera),
              ), // This trailing comma makes auto-formatting nicer for build methods.
            ],
          ),
        ),
      ),
    );
  }
}

// void bottomsheets(context) {
//   showModalBottomSheet(
//     context: context,
//     builder: (context) => SingleChildScrollView(
//       child: Container(
//         height: 400.0,
//         decoration: const BoxDecoration(
//           // border: Border.all(
//           //   color: Colors.pinkAccent,
//           //   width: 1.0,
//           // ),
//           color: Color.fromARGB(58, 248, 246, 246),
//         ),
//       ),
//     ),
//   );
// }
