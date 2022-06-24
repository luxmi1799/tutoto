import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tutoro/colors/colors.dart';

class login extends StatelessWidget{
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
                 child:Image.asset("assets/image/img.png",
                   width: 250,
                   height: 200,
                   // fit:BoxFit.fill,
                 ),
               ),
             ),

             const Padding(
               padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
               child: Center(
                 child: Text("login to continue",
                 style: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.bold,
                   fontSize: 28,
                 ),),
               ),
             ),

             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
               child: Container(
                 color: Colors.grey[200],
                 child: Row(
                   children: [
                     Expanded(
                       child: FlatButton(
                         onPressed: (){},
                         color: Color(int.parse("0xff${colors_color.main_theme}")),
                         child: Text("mobile number",
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 14,
                             fontWeight: FontWeight.bold,
                             backgroundColor:  Color(int.parse("0xff${colors_color.main_theme}")),
                           ),),
                       ),
                     ),
                     Expanded(
                       child: FlatButton(
                         onPressed: (){},
                         color: Color(int.parse("0xff${colors_color.main_theme}")),
                         child: Text("email",
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 14,
                             fontWeight: FontWeight.bold,
                             backgroundColor:  Color(int.parse("0xff${colors_color.main_theme}")),
                           ),),
                       ),
                     ),
                   ],
                 ),
               ),
             ),

             Padding(
               padding: const EdgeInsets.all(10.0),
               child: IntlPhoneField(
                 decoration: InputDecoration(
                   labelText: 'Phone Number',
                   border: UnderlineInputBorder(
                     borderSide: BorderSide(),
                   ),
                 ),
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
               child: InkWell(
                 onTap: (){
                 },
                 child: AnimatedContainer(
                   duration: Duration(seconds: 1),//empty container can use inside of widget
                   height: 45,
                   alignment: Alignment.center,
                   //changebtn?Icon(Icons.done,color: Colors.white,):
                   child:Text("Send OTP",style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 14,
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
               padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
               child: Center(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Text("New to Tutoro?",
                       style: TextStyle(
                         fontSize: 10,
                         color: Colors.grey,
                       ),
                     ),
                     InkWell(
                       child: Text("Signup for Free",
                         style: TextStyle(
                           fontSize: 12,
                           fontWeight: FontWeight.bold,
                           wordSpacing: 2,
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
}