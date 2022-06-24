import 'package:flutter/material.dart';

class myDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(

      child: Container(
        // color: Color(int.parse("0xff${drawer_color}")),
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child:Text("my drawer")
            ),

          ],
        ),
      ),
    );
  }
}