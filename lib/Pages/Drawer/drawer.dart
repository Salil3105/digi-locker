import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

// imports Screen
import '../Home Page/home.dart';

class DrawerSlider extends StatefulWidget {
  const DrawerSlider({Key? key}) : super(key: key);

  @override
  State<DrawerSlider> createState() => _DrawerSliderState();
}

class _DrawerSliderState extends State<DrawerSlider> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Home",
          baseStyle: TextStyle(),
          selectedStyle: TextStyle(),
        ),
        Home(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.white10,
      screens: _pages,
      initPositionSelected: 0,
    );
  }
}
