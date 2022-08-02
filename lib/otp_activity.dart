import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutoro/colors/colors.dart';
import 'package:tutoro/loding_bar.dart';
import 'package:tutoro/signup.dart';

import 'home.dart';

class otp_screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _otp_screen();
  }
}

class _otp_screen extends State<otp_screen>{
  String phonenum = "";
  var otp_val;
  String new_acc = "";
  String enterotp ="";
  var getdata;
  bool numeric = false;
  RegExp _numeric = RegExp(r'^-?[0-9]+$');

  @override
  void initState() {
    super.initState();
   // loading(context);
    Future.delayed(Duration(seconds: 2), () {
    });
    get_otp(context);
    isNumeric("8076799976");
  }

  get_otp(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
    //  Navigator.pop(context);
      new_acc = prefs.getString("new_account")!;
      phonenum = prefs.getString('mobile_number')!;
      otp_val = prefs.getInt("otp_found");
      isNumeric(phonenum);
    });
    print("phonem$phonenum");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          title: Text("Login / Signup",style: TextStyle(
            color: Colors.black
          ),),
          backgroundColor: Colors.white,
        ),
        body:  Column(
          children: [

            SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Center(
                child: Text("Enter Verification Code",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Center(
                child: Text("We have sent you a 6 digit verification code on",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
              child: Center(
                child: Text(
                  "$phonenum",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 20),
              child: OtpTextField(
                numberOfFields: 6,
                borderColor: Colors.amber,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                cursorColor: Color(0xffECAE0F),
                focusedBorderColor: Color(0xffECAE0F),
             //   enabledBorderColor: Color(0xffECAE0F),
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode){
                  setState(() {
                    enterotp = verificationCode;
                  });
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      }
                  );
                }, // end onSubmit
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: (){
                    numeric==true?
                    send_mobile_otp(phonenum):send_email_otp(phonenum);
                  },
                  child: Text("Resend OTP",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 30),
              child: InkWell(
                onTap: (){
                  setState(() {
                    loading(context);
                    match_otp(context);
                  });

                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),//empty container can use inside of widget
                  height: 50,
                  alignment: Alignment.center,
                  //changebtn?Icon(Icons.done,color: Colors.white,):
                  child:Text(
                    new_acc=="new_account"?"Sign Up":"Login",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
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
          ],
        ),
      );
  }

  match_otp(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(otp_val.toString() == enterotp){
      print("correct");
      if(new_acc == "new_account"){
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => sign_up()));
        prefs.remove('new_account');
      }
      else{
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => home()));
      }
    }
    else{
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "OTP is invalid",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1
      );
      print("otp_val$otp_val .....$enterotp");
    }
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
          var success = mapRes["commandResult"]["success"];
          var msg = mapRes["commandResult"]["message"];

          if(success == 1){
            var blogdetail= mapRes["commandResult"]["data"]["otp"];
            var user_id= mapRes["commandResult"]["data"]["user_id"];
            setState(() {
              getdata = blogdetail;
              prefs.setString("new_account", " ");
              prefs.setString("mobile_number",mobile);
              prefs.setString("otp_found",getdata);
              prefs.setString("user_id",user_id);
            });
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
          print("onValue${onValue.body}");
          Map mapRes = json.decode(onValue.body);
          var success = mapRes["commandResult"]["success"];
          var msg = mapRes["commandResult"]["message"];

          if(success == 1){
            var blogdetail= mapRes["commandResult"]["data"]["otp"];
            var user_id= mapRes["commandResult"]["data"]["user_id"];
            setState(() {
              getdata = blogdetail;
              prefs.setString("new_account", " ");
              prefs.setString("mobile_number",email);
              prefs.setString("otp_found","$getdata");
              prefs.setString("user_id",user_id);
              print("email_p$email");
            });
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
          var Mobile= mapRes["commandResult"]["data"]["Mobile"];
          setState(() {
            prefs.setString("email_id","$emaildetail");
            prefs.setString("name_user","$namedetail");
            prefs.setString("Mobile","$Mobile");
          });
          //   print("getdatata$email $name)");

        } catch (e) {
          print("response$e");
        }
      });
    });
  }

  bool isNumeric(String str) {
    numeric =  _numeric.hasMatch(str);
    print("numberic${ _numeric.hasMatch(str)}");
    return _numeric.hasMatch(str);
  }
}