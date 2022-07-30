import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutoro/colors/colors.dart';
import 'package:tutoro/home.dart';
import 'package:tutoro/loding_bar.dart';
import 'login.dart';

class sign_up extends StatelessWidget{
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
  String phonenum = "";
  bool phone_widget = true;
  bool email_widget = false;
  bool verified= false;
  var getdata;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    get_otp(context);
  }

  get_otp(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      phonenum = prefs.getString('mobile_number')!;
    });
    setState(() {
      _phoneController.text = phonenum;
    });
  }

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
                padding: const EdgeInsets.only(top: 50.0),
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

             Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 10),
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
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                    onCountryChanged: (country) {
                      print('Country changed to: ' + country.name);
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: "Full name",
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
                    style: TextStyle(color: Colors.black),
                     controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Email Id",
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
            ),
          ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                child: InkWell(
                  onTap: (){
                    loading(context);
                    signup_details(_emailController.text, _phoneController.text, _nameController.text);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),//empty container can use inside of widget
                    height: 50,
                    alignment: Alignment.center,
                    //changebtn?Icon(Icons.done,color: Colors.white,):
                    child:Text(
                      "Signup",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.center,
                     child: Text.rich(
                       TextSpan(
                         children: [
                           TextSpan(text: "By continuing, you agree to Tutoro",
                               style: TextStyle(
                                   color: Colors.grey,
                                   fontSize: 10,
                               ),
                           ),
                           TextSpan(text: "Term's & Conditions",
                             style: TextStyle(
                               color: Colors.black,
                               fontSize: 10,
                               fontWeight: FontWeight.bold
                             ),
                           ),
                           TextSpan(text: "and",
                             style: TextStyle(
                                 color: Colors.grey,
                                 fontSize: 10,
                             ),
                           ),
                           TextSpan(text: "Privacy Policy",
                             style: TextStyle(
                                 color: Colors.black,
                                 fontSize: 10,
                                 fontWeight: FontWeight.bold
                             ),
                           ),
                         ],
                       ),
                     ),
                    //child: Text("By continuing, you agree to Tutoro Term's & Conditions and Privacy Policy")
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
                          fontSize: 13,
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


  signup_details(String email,String mobile , String name ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String postUrl = "https://tutoro.co.in/mobile-authenticate/update-profile.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['Email'] = email;
    request.fields['Name'] = name;
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
          setState(() {
            getdata = blogdetail;
            prefs.setString("email",email);
            prefs.setString("name",name);
          });
          if(success == 1){
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => home()));
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

  Widget details(BuildContext context){
    return
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(10),
            child: IntlPhoneField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            //  onSubmitted: sendotp(),
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

          Align(
            alignment: Alignment.centerLeft,
              child: Text("By continuing, you agree to Tutoro Term's & Conditions and Privacy Policy")),
        ],
       ),
      );
  }
}