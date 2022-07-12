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
  bool values = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            centerTitle: true,
            title: Text("Support",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
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
              padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Username",
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
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
              padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 12),
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
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
              padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 12),
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 10),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: this.values,
                    onChanged: (value) {
                      setState(() {
                        this.values = value!;
                      });
                    },
                  ),//SizedBox
                  Text(
                    'Remember me',
                    style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),
                  ), //Text
                  //Checkbox
                ], //<Widget>[]
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 60),
              child: Center(
                child: InkWell(
                  onTap: (){
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),//empty container can use inside of widget
                    height: 50,
                    alignment: Alignment.center,
                    //changebtn?Icon(Icons.done,color: Colors.white,):
                    child:Text("Submit",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(int.parse("0xff${colors_color.main_theme}")),
                      borderRadius: BorderRadius.circular(10),
                    ),
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