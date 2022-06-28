import 'package:flutter/material.dart';
import 'package:tutoro/colors/colors.dart';

class myprofile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _myprofile();
  }
}

class _myprofile extends State<myprofile> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         leading: IconButton(
           icon: Icon(Icons.arrow_back, color: Colors.black),
           onPressed: () => Navigator.of(context).pop(),
         ),
         elevation: 0,
         title: Text("My Profile",style: TextStyle(
             color: Colors.black
         ),),
         backgroundColor: Colors.white,
       ),
       body: SingleChildScrollView(
         child: Column(
           children: [
             FittedBox(
               fit: BoxFit.contain,
               alignment: Alignment.center,
               child: Container(
                 alignment: Alignment.center,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: Color(int.parse("0xff${colors_color.main_theme}")),
                   border: Border.all(color: Colors.black, width: 0.5),
                 ),
                 padding: EdgeInsets.all(8.0),
                 child: Text("L", style: TextStyle(color: Colors.white)),
               ),
             )
           ],
         ),
       ),
     );
  }
}
