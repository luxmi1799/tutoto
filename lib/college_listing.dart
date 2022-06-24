import 'package:flutter/material.dart';
import 'package:tutoro/colors/colors.dart';

class college_list extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _college_list();
  }
}

class _college_list extends State<college_list> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
       appBar: AppBar(backgroundColor: Colors.white,),
       body: SingleChildScrollView(
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 12),
               child: Container(
                 height: 40,
                 color: Colors.grey[200],
                 child: TextField(
                   decoration: InputDecoration(
                     filled: true,
                     fillColor: Colors.grey[200],
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10.0),
                     ),
                     hintText: 'Search',
                     hintTextDirection: TextDirection.ltr,
                     suffixIcon: Icon(Icons.search),
                     prefixIcon: Icon(Icons.arrow_back),
                   ),
                 ),
               ),
             ),

             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Align(
                 alignment: Alignment.centerLeft,
                 child: Text("College Listing",
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                     color: Colors.black,
                   ),
                 ),
               ),
             ),

             Row(
               children: [

                 Container(
                   margin: const EdgeInsets.all(10.0),
                   padding: const EdgeInsets.all(3.0),
                   decoration: BoxDecoration(
                       border: Border.all(
                         color: Color(int.parse("0xff${colors_color.main_theme}")),
                       ),
                     borderRadius: BorderRadius.circular(8),
                   ),
                   child: Text(' All ',
                     style: TextStyle(
                       fontSize: 17,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),

               ],
             ),

           ],
         ),
       ),
     );
  }
}