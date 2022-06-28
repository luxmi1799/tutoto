import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:tutoro/colors/colors.dart';

import 'home.dart';

class otp_screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _otp_screen();
  }
}

class _otp_screen extends State<otp_screen>{
  String phonenum = "8975423996";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(
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
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Center(
                child: Text("We have sent you a 4 digit verification code on",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Center(
                child: Text("+91 $phonenum",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: OtpTextField(
                numberOfFields: 4,
                borderColor: Colors.amber,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode){
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
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
              child: InkWell(
                onTap: (){

                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => home()));
                  });



                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),//empty container can use inside of widget
                  height: 45,
                  alignment: Alignment.center,
                  //changebtn?Icon(Icons.done,color: Colors.white,):
                  child:Text("Login",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
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
          ],
        ),
      );
  }
}