import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tutoro/colors/colors.dart';

class edit_profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _edit_profile();
  }
}

class _edit_profile extends State<edit_profile> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: PreferredSize(
         preferredSize: Size.fromHeight(50.0), // here the desired height
         child: AppBar(
           title: Text("Edit Profile",style: TextStyle(
             color: Colors.black,
           ),),
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
             Padding(
               padding: const EdgeInsets.only(top: 60,bottom: 20),
               child: Center(
                 child:  AvatarView(
                   radius: 60,
                   borderColor: Colors.yellow,
                   isOnlyText: false,
                   text: Text('C', style: TextStyle(color: Colors.white, fontSize: 50),),
                   avatarType: AvatarType.CIRCLE,
                   backgroundColor: Colors.red,
                   imagePath: "assets/image/img_2.png",
                   placeHolder: Container(
                     child: Icon(Icons.person, size: 50,),
                   ),
                   errorWidget: Container(
                     child: Icon(Icons.error, size: 50,),
                   ),
                 ),
               ),
             ),


             Padding(
               padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 12),
               child: TextFormField(
                 decoration: InputDecoration(
                   hintText: "Full name",
                   hintStyle: TextStyle(
                     color: Colors.grey,
                     fontSize: 13,
                   ),
                   //labelText: "Batch Id",
                   labelStyle: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize:20,
                   ),
                   //prefixIcon: new Icon(Icons.lock),
                 ),
               ),
             ),

             Padding(
               padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 12),
               child: TextFormField(
                 decoration: InputDecoration(
                   hintText: "Email Id",
                   hintStyle: TextStyle(
                     color: Colors.grey,
                     fontSize: 13,
                   ),
                   //labelText: "Batch Id",
                   labelStyle: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize:20,
                   ),
                   //prefixIcon: new Icon(Icons.lock),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 12),
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
               padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 12),
               child: TextFormField(
                 decoration: InputDecoration(
                   hintText: "Address",
                   hintStyle: TextStyle(
                     color: Colors.grey,
                     fontSize: 13,
                   ),
                   //labelText: "Batch Id",
                   labelStyle: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize:20,
                   ),
                   //prefixIcon: new Icon(Icons.lock),
                 ),
               ),
             ),

             Padding(
               padding: const EdgeInsets.all(30.0),
               child: Center(
                 child: Container(
                   width: 150,
                   height: 50,
                   child: RaisedButton(
                     onPressed: (){},
                     color: Color(int.parse("0xff${colors_color.main_theme}")),
                     child: Text("Submit",
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 15,
                         fontWeight: FontWeight.bold,
                         backgroundColor:  Color(int.parse("0xff${colors_color.main_theme}")),
                       ),),
                   ),
                 ),
               ),
             ),
           ],
         ),
       ),
     );
  }
}