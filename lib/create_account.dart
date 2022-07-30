import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutoro/colors/colors.dart';
import 'package:http/http.dart' as http;
import 'package:tutoro/signup.dart';
import 'loding_bar.dart';
import 'login.dart';
import 'otp_activity.dart';

class create_account extends StatelessWidget{
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
  bool verified= false;
  var getdata;
  bool verified_enable = false;
  TextEditingController _phoneController = TextEditingController();
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
                  child:Image.asset("assets/image/pic.png",
                    width: 200,
                    height: 180,
                    // fit:BoxFit.fill,
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Center(
                  child: Text("Create an account",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),),
                ),
              ),

              Offstage(
                offstage: email_widget,   //true means gayab
                child: phone_widget == true? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
                  child: IntlPhoneField(
                    controller: _phoneController,
                    initialCountryCode: 'IN',
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                   // onSubmitted: sendotp(),
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                    onCountryChanged: (country) {
                      print('Country changed to: ' + country.name);
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Enter your Phone Number';
                      }
                      else{
                        setState(() {
                          print("verified_enable$verified_enable");
                          verified_enable = true;
                        });
                        print("verified_enable$verified_enable");                       }
                      return null;
                    },
                  ),
                ):otp_enter(context),
              ),



              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 30),
                child: InkWell(
                  onTap: (){

                    setState(() {
                      verified_enable ==false?null:
                      loading(context);
                      send_mobile_otp(_phoneController.text);
                      verified_enable = false;
                    });
                   // Navigator.of(context).push(MaterialPageRoute(builder: (context) => sign_up()));
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),//empty container can use inside of widget
                    height: 50,
                    alignment: Alignment.center,
                    //changebtn?Icon(Icons.done,color: Colors.white,):
                    child:Text(
                      "Verify",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                    ),
                    decoration: BoxDecoration(
                      color: verified_enable == false?Color(0xffECAE0F).withOpacity(.3):Color(0xffECAE0F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Already have an account? ",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: (){

                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => login()));
                          });
                          //
                        },
                        child: Text("Login",
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

  Widget details(BuildContext context){
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
          child: IntlPhoneField(
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: UnderlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            //onSubmitted: sendotp(),
            onChanged: (phone) {
              print(phone.completeNumber);
            },
            onCountryChanged: (country) {
              print('Country changed to: ' + country.name);
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            // controller: emailController,
            decoration: InputDecoration(
              hintText: "full name",
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
        ),

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            // controller: emailController,
            decoration: InputDecoration(
              hintText: "email",
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
        ),

      ],
    );
  }

  send_mobile_otp(String mobile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String postUrl = "https://tutoro.co.in/mobile-authenticate/mobile-number.php";
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
          var success = mapRes["commandResult"]["success"];
          var msg = mapRes["commandResult"]["message"];
          print("msss$msg");
          setState(() {
            getdata = blogdetail;
            prefs.setString("new_account", "new_account");
            prefs.setString("mobile_number",mobile);
            prefs.setInt("otp_found",getdata);
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
}