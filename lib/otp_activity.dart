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


  @override
  void initState() {
    super.initState();
   // loading(context);
    Future.delayed(Duration(seconds: 2), () {
    });
    get_otp(context);
  }

  get_otp(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
    //  Navigator.pop(context);
      new_acc = prefs.getString("new_account")!;
      phonenum = prefs.getString('mobile_number')!;
      otp_val = prefs.getInt("otp_found");
    });
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
              padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 30),
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
}