import 'package:digi_locker_app/Pages/Home%20Page/recent.dart';
import 'package:digi_locker_app/Pages/Home%20Page/share.dart';
import 'package:digi_locker_app/Pages/Home%20Page/star.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Drawer/drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.black12,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blueAccent,
            title: Text(
              "   Home",
              style: GoogleFonts.aBeeZee(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),

            actions: [
              Container(
                margin: EdgeInsets.fromLTRB(5, 10, 15, 10),
                height: 20,
                width: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white30,
                  // border: Border.all(
                  //   color: Colors.black,
                  //   width: 1,
                  // ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Row(
                          children: [
                            Container(
                              width: 200,
                              child: TextField(
                                cursorHeight: 20,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search",
                                  hintStyle: GoogleFonts.aBeeZee(
                                    fontSize: 11,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Icon(
                          Icons.search_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            // TODO: TOP NAVIGATION BAR
            bottom: new TabBar(
              // isScrollable: true,
              tabs: [
                Tab(
                  child: Text(
                    "Recent",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Share",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Starred",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          body: Scaffold(
            drawer: DrawerSlider(),
            body: TabBarView(
              children: [
                Container(
                  child: Recent(),
                ),
                Center(
                  child: Share(),
                ),
                Center(
                  child: Star(),
                ),
              ],
            ),
          ),
        ),
      );
}
