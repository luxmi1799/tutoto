import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutoro/colors/colors.dart';
import 'package:tutoro/create_account.dart';
import 'package:http/http.dart' as http;
import 'package:tutoro/otp_activity.dart';

import 'loding_bar.dart';

class login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
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
  bool phone = true;
  bool email = false;
  bool phone_widget = true;
  bool email_widget = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  final emailGlobalKey = GlobalKey < FormState > ();
  bool otp_enable = false;
  var getdata;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Material(
       child: SingleChildScrollView(
         child: Container(
           color: Colors.white,
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.only(top: 50.0,bottom: 10),
                 child: Center(
                   child:Container(
                     width: 200,
                     height: 180,
                     child: Image.asset("assets/image/pic.png",
                     // fit:BoxFit.fill,
                     ),
                   ),
                 ),
               ),

               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                 child: Center(
                   child: Text("Login to continue",
                   style: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.bold,
                     fontSize: 28,
                   ),),
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 15),
                 child: Container(
                   height: 60,
                   color: Colors.grey[200],
                   child: Row(
                     children: [
                       Expanded(
                           child: Container(
                             height: 50,
                             child: FlatButton(
                               onPressed: (){

                                 setState(() {
                                   phone = true;
                                   email = false;
                                   email_widget=false;
                                 });

                               },
                               color: phone==true?Color(int.parse("0xff${colors_color.main_theme}")):Colors.grey[200],
                               child: Text("Mobile No.",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 15,
                                   fontWeight: FontWeight.bold,
                                   backgroundColor:phone==true?Color(int.parse("0xff${colors_color.main_theme}")):Colors.grey[200],
                                 ),),
                             ),
                           ),
                       ),
                       Expanded(
                         child: Container(
                           height: 50,
                           child: FlatButton(
                             onPressed: (){
                               setState(() {
                                 email = true;
                                 phone=false;
                               });
                               setState(() {
                                 email_widget = true;
                               });
                             },
                             color:email==true?Color(int.parse("0xff${colors_color.main_theme}")):Colors.grey[200],
                             child: Text("Email Id",
                               textAlign: TextAlign.center,
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold,
                                 backgroundColor:email==true?Color(int.parse("0xff${colors_color.main_theme}")):Colors.grey[200],
                               ),),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),

              Offstage(
                offstage: email_widget,   //true means gayab
                child: phone_widget == true? Padding(
                   padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
                   child: IntlPhoneField(
                     controller: _phoneController,
                     style: TextStyle(color: Colors.black),
                     initialCountryCode: 'IN',
                     decoration: InputDecoration(
                       labelText: 'Phone Number',
                       border: UnderlineInputBorder(
                         borderSide: BorderSide(),
                       ),
                     ),
                     //onSubmitted: sendotp(),
                    // onSaved: sendotp(),
                     onChanged: (phone) {
                       print(phone.completeNumber);
                     },
                     validator: (value) {
                       if (value == null) {
                         return 'Enter your Phone Number';
                       }
                       else{
                         setState(() {
                           print("otp_enable$otp_enable");
                           otp_enable = true;
                         });
                         print("otp_enable$otp_enable");                       }
                       return null;
                     },
                     onCountryChanged: (country) {
                       print('Country changed to: ' + country.name);
                     },
                   ),
                 ):otp_enter(context),
              ),

               Offstage(
                 offstage: !email_widget,
                 child: Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Form(
                     key: emailGlobalKey,
                     child: TextFormField(
                       keyboardType: TextInputType.emailAddress,
                       controller: _emailController,
                       style: TextStyle(color: Colors.black),
                       // controller: emailController,
                       decoration: InputDecoration(
                         hintText: "Email ID",
                         // labelText: "OTP",
                         labelStyle: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize:20,
                           color: Colors.grey,
                         ),
                         //prefixIcon: new Icon(Icons.email),
                       ),
                       validator: (value) {
                         if (value!.isEmpty) {
                           return 'Enter your Email address';
                         }
                         if (!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value)) {
                           return 'Enter a Valid Email address';
                         }
                         else{
                           setState(() {
                             print("otp_enable$otp_enable");
                             otp_enable = true;
                           });
                           print("otp_enable$otp_enable");                          }
                         return null;
                       },
                     ),
                   ),
                 ),
               ),


               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 30),
                 child: InkWell(
                   onTap: (){
                     print("phone_p$phone");
                     print("email_p$email");
                     setState(() {
                       if(phone == true){
                         otp_enable ==false?null:
                         loading(context);
                         send_mobile_otp(_phoneController.text);
                         otp_enable = false;
                       }
                      else{
                         otp_enable ==false?null:
                         loading(context);
                         send_email_otp(_emailController.text);
                         otp_enable = false;
                       }
                    });
                   },
                   child: AnimatedContainer(
                     duration: Duration(seconds: 1),//empty container can use inside of widget
                     height: 50,
                     alignment: Alignment.center,
                     //changebtn?Icon(Icons.done,color: Colors.white,):
                     child:Text("Send OTP",style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 15,
                       color: Colors.white,
                     ),
                     ),
                     decoration: BoxDecoration(
                       color: otp_enable == false?Color(0xffECAE0F).withOpacity(.3):Color(0xffECAE0F),
                       borderRadius: BorderRadius.circular(5),
                     ),
                   ),
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 10),
                 child: Center(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text("New to Tutoro?",
                         style: TextStyle(
                           fontSize: 13,
                           color: Colors.grey,
                         ),
                       ),
                       InkWell(

                         onTap: (){
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) => create_account()));

                           //
                         },
                         child: Text(" Signup for Free",
                           style: TextStyle(
                             fontSize: 15,
                             fontWeight: FontWeight.bold,
                             color: Colors.black,
                           ),
                         ),
                       ),

                     ],
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
     );
  }

   send_mobile_otp(String mobile) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     String postUrl = "https://tutoro.co.in/mobile-authenticate/login.php";
     print("stringrequest");
     var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['Mobile'] = mobile;
    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          Navigator.pop(context);
          print("onValue${onValue.body}");
          Map mapRes = json.decode(onValue.body);
          var blogdetail= mapRes["commandResult"]["data"]["otp"];
          var user_id= mapRes["commandResult"]["data"]["user_id"];
          var success = mapRes["commandResult"]["success"];
          var msg = mapRes["commandResult"]["message"];
          setState(() {
            getdata = blogdetail;
            prefs.setString("new_account", " ");
            prefs.setString("mobile_number",mobile);
            prefs.setInt("otp_found",getdata);
            prefs.setString("user_id",user_id);
          });
          if(success == 1){
            userdata(user_id);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => otp_screen()));
          }
          else{
            Fluttertoast.showToast(
                msg: msg,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1
            );
          }
          print("getdatata$getdata)");

        } catch (e) {
          print("response$e");
        }
      });
    });
  }


   send_email_otp(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String postUrl = "https://tutoro.co.in/mobile-authenticate/login-email.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['Email'] = email;
    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          Navigator.pop(context);
          print("onValue${onValue.body}");
          Map mapRes = json.decode(onValue.body);
          var blogdetail= mapRes["commandResult"]["data"]["otp"];
          var success = mapRes["commandResult"]["success"];
          var msg = mapRes["commandResult"]["message"];
          setState(() {
            getdata = blogdetail;
            prefs.setString("mobile_number","$email");
            prefs.setString("otp_found","$getdata");
          });
          if(success == 1){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => otp_screen()));
          }
          else{
            Fluttertoast.showToast(
                msg: msg,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1
            );
          }
          print("getdatata$getdata)");

        } catch (e) {
          print("response$e");
        }
      });
    });
  }

  userdata(String UserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String postUrl = "https://tutoro.co.in/mobile-authenticate/userById.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['UserId'] = UserId;
    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          print("onValue1${onValue.body}");
          Map mapRes = json.decode(onValue.body);
          var emaildetail= mapRes["commandResult"]["data"]["Email"];
          var namedetail= mapRes["commandResult"]["data"]["Name"];
          setState(() {
            prefs.setString("email_id","$emaildetail");
            prefs.setString("name_user","$namedetail");
          });
       //   print("getdatata$email $name)");

        } catch (e) {
          print("response$e");
        }
      });
    });
  }

  Widget otp_enter(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text("please enter the OTP send to 9976547899",style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),),
              Icon(Icons.edit),
            ],
          ),

          SizedBox(
            height: 5,
          ),
          TextFormField(
           // controller: emailController,
            decoration: InputDecoration(
              hintText: "OTP",
             // labelText: "OTP",
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:20,
                color: Colors.grey,
              ),
              //prefixIcon: new Icon(Icons.email),
            ),
            validator: (text){
              return null;
            },
          ),

          SizedBox(
            height: 5,
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Text("resend OTP in 00:60",
              textAlign: TextAlign.left,
              style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),),
          ),
        ],
      ),
    );
  }

}