import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutoro/colors/colors.dart';
import 'package:http/http.dart' as http;
import 'package:tutoro/loding_bar.dart';

import 'home.dart';

class applyloan extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _applyloan();
  }
}

class _applyloan extends State<applyloan> {
  bool values = false;


  var name;
  var email;
  var mobile;
  var college_name;
  TextEditingController _msgController = TextEditingController();
  TextEditingController _amtController = TextEditingController();

  @override
  void initState() {
    super.initState();
    get_otp(context);
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        print("222");
      });
    });
  }

  get_otp(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return new BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child:  AlertDialog(
              content: Row(children: [
                CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
                Container(margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
              ]),
            )
        );
      },
    );
    setState(() {
      name = prefs.getString("name_user")!;
      email = prefs.getString("email_id")!;
      mobile = prefs.getString("Mobile")!;
      college_name = prefs.getString("collegeName")!;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     appBar:  AppBar(
       centerTitle: true,
       title: Text("Apply",
         textAlign: TextAlign.start,
         style: TextStyle(
           fontSize: 22,
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
     body: SingleChildScrollView(
       child: Column(
         children: [
           name==""?Container(color: Colors.white,):
           Padding(
             padding: const EdgeInsets.all(0.0),
             child: Column(
               children: [

                 Padding(
                   padding: EdgeInsets.only(top: 20.0,left: 12,bottom: 10),
                   child: Align(
                     alignment: Alignment.centerLeft,
                     child: Text("Name",
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
                       hintText: 'Enter name',
                       hintStyle: TextStyle(
                           fontSize: 14
                       ),
                       labelText: "$name".toCapitalized(),
                       labelStyle: TextStyle(
                        // fontWeight: FontWeight.bold,
                         fontSize:20,
                         color: Colors.black,
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: EdgeInsets.only(top: 20.0,left: 12,bottom: 10),
                   child: Align(
                     alignment: Alignment.centerLeft,
                     child: Text("Email Id",
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
                       hintText: 'Enter email id',
                       hintStyle: TextStyle(
                           fontSize: 14
                       ),
                       labelText: "$email".toCapitalized(),
                       labelStyle: TextStyle(
                       //  fontWeight: FontWeight.bold,
                         fontSize:18,
                         color: Colors.black,
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: EdgeInsets.only(top: 20.0,left: 12,bottom: 10),
                   child: Align(
                     alignment: Alignment.centerLeft,
                     child: Text("Mobile No.",
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
                     keyboardType: TextInputType.number,
                     decoration: InputDecoration(
                       border: const OutlineInputBorder(),
                       hintText: 'Enter number',
                       hintStyle: TextStyle(
                           fontSize: 14
                       ),
                       labelText: "$mobile",
                       labelStyle: TextStyle(
                         //fontWeight: FontWeight.bold,
                         fontSize:18,
                         color: Colors.black,
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: EdgeInsets.only(top: 20.0,left: 12,bottom: 10),
                   child: Align(
                     alignment: Alignment.centerLeft,
                     child: Text("Enter Amount",
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
                     keyboardType: TextInputType.number,
                     controller: _amtController,
                     //autofocus: true,
                     decoration: InputDecoration(
                       border: const OutlineInputBorder(),
                       hintText: 'e.g:1000',
                       hintStyle: TextStyle(
                           fontSize: 14
                       ),
                      // labelText: "Loan amount",
                       labelStyle: TextStyle(
                        // fontWeight: FontWeight.bold,
                         fontSize:18,
                         color: Colors.black,
                       ),
                     ),
                   ),
                 ),

                 Padding(
                   padding: EdgeInsets.only(top: 20.0,left: 12,bottom: 10),
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
                     controller: _msgController,
                     keyboardType: TextInputType.multiline,
                     maxLines: 4,
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
                             print("value$values");
                           });
                           if(values == true){
                            // _showDialog();
                           }
                         },
                       ),//SizedBox
                       Text(
                         'Do you want to apply for loan ',
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
                         if(values==true){
                           setState(() {
                             apply(name, email, mobile, _msgController.text,college_name,_amtController.text);
                             Navigator.push(context, MaterialPageRoute(builder: (MaterialPageRoute) => home()));
                           });
                         }
                        else{
                           Fluttertoast.showToast(
                               msg: "Please check",
                               toastLength: Toast.LENGTH_LONG,
                               gravity: ToastGravity.CENTER,
                               timeInSecForIosWeb: 1
                           );
                         }
                       },
                       child: AnimatedContainer(
                         duration: Duration(seconds: 1),//empty container can use inside of widget
                         height: 50,
                         alignment: Alignment.center,
                         //changebtn?Icon(Icons.done,color: Colors.white,):
                         child:Text("Submit",style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 17,
                           color: Colors.white,
                         ),
                         ),
                         decoration: BoxDecoration(
                           color: Color(int.parse("0xff${colors_color.main_theme}")),
                           borderRadius: BorderRadius.circular(4),
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ],
       ),
     ),
   );
  }

  _showDialog() async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return new _SystemPadding(
        child: new AlertDialog(
        contentPadding: const EdgeInsets.all(9.0),
        content: new Row(
        children: <Widget>[
        new Expanded(
        child: new TextField(
        keyboardType: TextInputType.number,
        controller: _amtController,
        autofocus: true,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
          hintText: 'e.g:1000',
          hintStyle: TextStyle(
              fontSize: 14
          ),
          labelText: "Loan amount",
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize:20,
            color: Colors.black54,
          ),
        ),
        ),
        )
        ],
        ),
        actions: <Widget>[
        new FlatButton(
        child: const Text('APPLY'),
        onPressed: () {

        // Navigator.pop(context);
        }),
        new FlatButton(
        child: const Text('CANCEL'),
        onPressed: () {
        Navigator.pop(context);
        })
        ]
        ,
        )
        ,
        );
      }
    );
  }

  void apply(String name,String email,String mobile ,String message,String college_name ,String amt) async {
    String postUrl = "https://tutoro.co.in/mobile-authenticate/support.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['Name'] = name;
    request.fields['Email'] = email;
    request.fields['Mobile'] = mobile;
    request.fields['Message'] = message;
    request.fields['College'] = college_name;
    request.fields['LoanAmount'] = amt;

    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          print("onValue${onValue.body}");
          Map mapRes = json.decode(onValue.body);
          var success= mapRes["commandResult"]["success"];
          setState(() {
          });
        } catch (e) {
          print("response$e");
        }
      });
    });
  }
 }


class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({required this.child});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}