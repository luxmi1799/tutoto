import 'package:flutter/material.dart';
import 'package:tutoro/colors/colors.dart';

class support_s extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _support();
  }
}

class _support extends State<support_s> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            // ...
          ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Support",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),


            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Username",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter username',
                  hintStyle: TextStyle(
                    fontSize: 14
                  ),
                  //labelText: "Phone number",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Email",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter email',
                  hintStyle: TextStyle(
                      fontSize: 14
                  ),
                  //labelText: "Phone number",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Password",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter password',
                  hintStyle: TextStyle(
                    fontSize: 14
                  ),
                  //labelText: "Phone number",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Your message",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter message',
                  hintStyle: TextStyle(
                    fontSize: 14
                  ),
                  //labelText: "Phone number",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),

            //remenber me

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Container(
                  width: 150,
                  height: 50,
                  child: RaisedButton(
                    onPressed: (){},
                    color: Color(int.parse("0xff${colors_color.main_theme}")),
                    child: Text("Submit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        backgroundColor:  Color(int.parse("0xff${colors_color.main_theme}")),
                      ),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
   }
}