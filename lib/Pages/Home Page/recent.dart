import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Recent extends StatefulWidget {
  const Recent({Key? key}) : super(key: key);

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: Colors.redAccent,
        //     width: 1,
        //   ),
        // ),
        child: Center(
          child: Text(
            'Recent',
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
