import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutoro/colors/colors.dart';
import 'package:tutoro/loding_bar.dart';

import 'custom_dialog.dart';

class support_s extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _support();
  }
}

class _support extends State<support_s> {
  bool values = false;

  var name;
  var email;
  var mobile;
  TextEditingController _msgController = TextEditingController();

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
    });
    Navigator.pop(context);
  }

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
          children: [
            name==""?Container(color: Colors.white,): Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      enabled: false,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter name',
                        hintStyle: TextStyle(
                          fontSize: 14
                        ),
                        labelText: "$name".toCapitalized(),
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
                      child: Text("Email",
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
                      enabled: false,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter email',
                        hintStyle: TextStyle(
                          fontSize: 14
                        ),
                        labelText: "$email".toCapitalized(),
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
                      child: Text("Phone Number",
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
                        hintText: 'Enter phone no.',
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
                      maxLines: 6,
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

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 10),
                  //   child: Row(
                  //     children: <Widget>[
                  //       Checkbox(
                  //         value: this.values,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             this.values = value!;
                  //           });
                  //         },
                  //       ),//SizedBox
                  //       Text(
                  //         'Remember me',
                  //         style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),
                  //       ), //Text
                  //       //Checkbox
                  //     ], //<Widget>[]
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 60),
                    child: Center(
                      child: InkWell(
                        onTap: (){
                          support(name, email, mobile, _msgController.text);
                          showDialog(context: context,
                              builder: (BuildContext context){
                                return CustomDialogBox(
                                  title: "Thank You!!",
                                  descriptions: "Tutoro team will contact you soon!!",
                                  text: "Done",
                                  img: Image.asset("assets/image/img.png"),
                                );
                              }
                          );
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
  void support(String name,String email,String mobile ,String message) async {
    String postUrl = "https://tutoro.co.in/mobile-authenticate/support.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['Name'] = name;
    request.fields['Email'] = email;
    request.fields['Mobile'] = mobile;
    request.fields['Message'] = message;

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
//
// showGeneralDialog(
// context: context,
// barrierLabel: "Barrier",
// barrierDismissible: true,
// barrierColor: Colors.black.withOpacity(0.5),
// transitionDuration: Duration(milliseconds: 700),
// pageBuilder: (_, __, ___) {
// return Center(
// child: Container(
// height: 240,
// child: SizedBox.expand(
// child: Image.asset("assets/thankyou.png"),
// ),
// margin: EdgeInsets.symmetric(horizontal: 20),
// decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40)),
// ),
// );
// },
// transitionBuilder: (_, anim, __, child) {
// Tween<Offset> tween;
// if (anim.status == AnimationStatus.reverse) {
// tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
// } else {
// tween = Tween(begin: Offset(1, 0), end: Offset.zero);
// }
//
// return SlideTransition(
// position: tween.animate(anim),
// child: FadeTransition(
// opacity: anim,
// child: child,
// ),
// );
// },
// );