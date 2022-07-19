import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tutoro/colors/colors.dart';
import 'package:tutoro/create_account.dart';
import 'package:tutoro/home.dart';
import 'package:tutoro/otp_activity.dart';

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
                     child: Image.asset("assets/image/tutorologo.png",
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
                     initialCountryCode: 'IN',
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

               Offstage(
                 offstage: !email_widget,
                 child: Padding(
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
               ),


               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 30),
                 child: InkWell(
                   onTap: (){

                     setState(() {
                      // phone_widget = false;
                     });

                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => otp_screen()));

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
                       color: Color(int.parse("0xff${colors_color.main_theme}")),
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

                           setState(() {
                             Navigator.of(context).push(MaterialPageRoute(builder: (context) => create_account()));
                           });
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
}