import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Share extends StatefulWidget {
  const Share({Key? key}) : super(key: key);

  @override
  State<Share> createState() => _ShareState();
}

class _ShareState extends State<Share> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: Colors.pink,
        //     width: 1,
        //   ),
        // ),
        child: Center(
          child: Text(
            'Share',
            style: GoogleFonts.mina(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
