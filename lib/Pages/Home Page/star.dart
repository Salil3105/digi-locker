import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import widgets ;
import '../../Widgets/Add_pic.dart';

class Star extends StatefulWidget {
  const Star({Key? key}) : super(key: key);
  @override
  State<Star> createState() => _StarState();
}

class _StarState extends State<Star> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddPic(),
    );
  }
}
