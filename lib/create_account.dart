import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tutoro/colors/colors.dart';
import 'package:tutoro/home.dart';
import 'package:tutoro/signup.dart';

import 'login.dart';

class create_account extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child:Image.asset("assets/image/tutorologo.png",
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
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  onSubmitted: sendotp(),
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    print('Country changed to: ' + country.name);
                  },
                ),
              ):otp_enter(context),
            ),



            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
              child: InkWell(
                onTap: (){

                  setState(() {
                    phone_widget = false;
                    verified = true;
                  });

                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => sign_up()));

                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),//empty container can use inside of widget
                  height: 45,
                  alignment: Alignment.center,
                  //changebtn?Icon(Icons.done,color: Colors.white,):
                  child:Text(
                     verified==false?
                    "Verify":"Signup",style: TextStyle(
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

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
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
    );
  }

  sendotp() {

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
            onSubmitted: sendotp(),
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
}