import 'package:flutter/material.dart';

class login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _login(),
    );
    // TODO: implement build
  }

}

class _login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _login_body();
  }
}

class _login_body extends State<_login> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Material(
       child: SingleChildScrollView(
         child: Column(
           children: [
       
             
             Center(
               child:Image.asset("assets/image/img.png",
                 fit:BoxFit.cover,),
             ),
             
           ],
         ),
       ),
     );
  }
}