import 'package:flutter/material.dart';
import 'package:tutoro/colors/colors.dart';

class applyloan extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _applyloan();
  }
}

class _applyloan extends State<applyloan> {
  bool values = false;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     appBar:  AppBar(
       centerTitle: true,
       title: Text("Apply",
         textAlign: TextAlign.start,
         style: TextStyle(
           fontSize: 22,
           fontWeight: FontWeight.bold,
           color: Colors.black,
         ),
       ),
       leading: IconButton(
         icon: Icon(Icons.arrow_back, color: Colors.black),
         onPressed: () => Navigator.of(context).pop(),
       ),
       backgroundColor: Colors.white,
       elevation: 0,
       // ...
     ),
     body: SingleChildScrollView(
       child: Column(
         children: [

           Padding(
             padding: EdgeInsets.only(top: 20.0,left: 12,bottom: 10),
             child: Align(
               alignment: Alignment.centerLeft,
               child: Text("Name",
                 textAlign: TextAlign.start,
                 style: TextStyle(
                   fontSize: 15,
                   fontWeight: FontWeight.bold,
                   color: Colors.black54,
                 ),
               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
             child: TextField(
               decoration: InputDecoration(
                 border: const OutlineInputBorder(),
                 hintText: 'Enter name',
                 hintStyle: TextStyle(
                     fontSize: 14
                 ),
                 //labelText: "Phone number",
                 labelStyle: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize:20,
                   color: Colors.black54,
                 ),
               ),
             ),
           ),

           Padding(
             padding: EdgeInsets.only(top: 20.0,left: 12,bottom: 10),
             child: Align(
               alignment: Alignment.centerLeft,
               child: Text("Email Id",
                 textAlign: TextAlign.start,
                 style: TextStyle(
                   fontSize: 15,
                   fontWeight: FontWeight.bold,
                   color: Colors.black54,
                 ),
               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
             child: TextField(
               decoration: InputDecoration(
                 border: const OutlineInputBorder(),
                 hintText: 'Enter email id',
                 hintStyle: TextStyle(
                     fontSize: 14
                 ),
                 //labelText: "Phone number",
                 labelStyle: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize:20,
                   color: Colors.black54,
                 ),
               ),
             ),
           ),

           Padding(
             padding: EdgeInsets.only(top: 20.0,left: 12,bottom: 10),
             child: Align(
               alignment: Alignment.centerLeft,
               child: Text("Mobile No.",
                 textAlign: TextAlign.start,
                 style: TextStyle(
                   fontSize: 15,
                   fontWeight: FontWeight.bold,
                   color: Colors.black54,
                 ),
               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
             child: TextField(
               keyboardType: TextInputType.number,
               decoration: InputDecoration(
                 border: const OutlineInputBorder(),
                 hintText: 'Enter number',
                 hintStyle: TextStyle(
                     fontSize: 14
                 ),
                 //labelText: "Phone number",
                 labelStyle: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize:20,
                   color: Colors.black54,
                 ),
               ),
             ),
           ),

           Padding(
             padding: EdgeInsets.only(top: 20.0,left: 12,bottom: 10),
             child: Align(
               alignment: Alignment.centerLeft,
               child: Text("Address",
                 textAlign: TextAlign.start,
                 style: TextStyle(
                   fontSize: 15,
                   fontWeight: FontWeight.bold,
                   color: Colors.black54,
                 ),
               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
             child: TextField(
               decoration: InputDecoration(
                 border: const OutlineInputBorder(),
                 hintText: 'Enter address',
                 hintStyle: TextStyle(
                     fontSize: 14
                 ),
                 //labelText: "Phone number",
                 labelStyle: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize:20,
                   color: Colors.black54,
                 ),
               ),
             ),
           ),

           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 10),
             child: Row(
               children: <Widget>[
                 Checkbox(
                   value: this.values,
                   onChanged: (value) {
                     setState(() {
                       this.values = value!;
                     });
                   },
                 ),//SizedBox
                 Text(
                   'Do you want to apply for loan ',
                   style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),
                 ), //Text
                 //Checkbox
               ], //<Widget>[]
             ),
           ),

           Padding(
             padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 60),
             child: Center(
               child: AnimatedContainer(
                 duration: Duration(seconds: 1),//empty container can use inside of widget
                 height: 50,
                 alignment: Alignment.center,
                 //changebtn?Icon(Icons.done,color: Colors.white,):
                 child:Text("Submit",style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 17,
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
     ),
   );
  }
}