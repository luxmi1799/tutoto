import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:tutoro/colors/colors.dart';

class college_details extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
      return _college_details();
  }
}

class _college_details extends State<college_details> {
  PageController? controller;
  GlobalKey<PageContainerState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Material(
       child: Scaffold(
         appBar: AppBar(
           elevation: 0,
           automaticallyImplyLeading: false,
           backgroundColor: Colors.white,
           title: ClipRRect(
             borderRadius: BorderRadius.circular(10.0),
             child: Container(
               width: double.infinity,
               height: 40,
               color: Colors.grey[200],
               // child: Center(
               child: TextField(
                 textAlign: TextAlign.start,
                 decoration: InputDecoration(

                   contentPadding: EdgeInsets.only(top: 5),
                   filled: true,
                   // fillColor: Colors.grey[200],
                   // border: OutlineInputBorder(
                   //   borderRadius: BorderRadius.circular(10.0),
                   // ),
                   hintText: 'Search',
                   hintStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                   hintTextDirection: TextDirection.ltr,
                   suffixIcon: Icon(Icons.search,color: Colors.black,),
                   prefixIcon: Icon(Icons.arrow_back,color: Colors.black,),
                 ),
               ),
               // ),
             ),
           ),
         ),
         body: SingleChildScrollView(
           child: Column(
             children: [
               Padding(
                 padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                 child: Align(
                   alignment: Alignment.centerLeft,
                   child: Text("College Details",
                     textAlign: TextAlign.start,
                     style: TextStyle(
                       fontSize: 22,
                       fontWeight: FontWeight.bold,
                       color: Colors.black,
                     ),
                   ),
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 8.0),
                 child: Container(
                   //color: Colors.pink,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: Colors.orangeAccent
                   ),
                   child: Container(
                     height: 200.0,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: PageIndicatorContainer(
                       key: key,
                       child: PageView(
                         children: <Widget>[
                           Text('1'),
                           Text('2'),
                           Text('3'),
                           Text('4'),
                         ],
                         controller: controller,
                         reverse: true,
                       ),
                       align: IndicatorAlign.bottom,
                       length: 4,
                       indicatorSpace: 10.0,
                       shape: IndicatorShape.circle(size: 8),
                     ),
                   ),
                 ),
               ),
               // floatingActionButton: FloatingActionButton(
               //   child: Icon(Icons.refresh),
               //   tooltip: "force refresh indicator",
               //   onPressed: () {
               //     key.currentState?.forceRefreshState();
               //   },
               // ),

               Padding(
                 padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                 child: Align(
                   alignment: Alignment.centerLeft,
                   child: Text("All India Insitute of Medical Sciences",
                     textAlign: TextAlign.start,
                     style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                       color: Colors.black,
                     ),
                   ),
                 ),
               ),

               Padding(
                 padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                 child: Align(
                   alignment: Alignment.centerLeft,
                   child: Text("Delhi",
                     textAlign: TextAlign.start,
                     style: TextStyle(
                       fontSize: 16,
                       color: Colors.grey,
                     ),
                   ),
                 ),
               ),

               Padding(
                 padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                 child: Align(
                   alignment: Alignment.centerLeft,
                   child: Text("4.5",
                     textAlign: TextAlign.start,
                     style: TextStyle(
                       fontSize: 16,
                       color: Colors.grey,
                     ),
                   ),
                 ),
               ),

               Padding(
                 padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                 child: Align(
                   alignment: Alignment.centerLeft,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Text("World Ranking",
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 16,
                           ),),

                           Text("873 Rank",
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 16,
                           ),),
                         ],

                       ),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Text("Bond",
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 16,
                           ),),

                           Text("-",
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 16,
                           ),),
                         ],
                       ),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Text("Private/Government",
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 16,
                           ),),

                           Text("Private",
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 16,
                           ),),
                         ],
                       ),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Text("Institute Fee/Hostel Fee",
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 16,
                           ),),

                           Text("2 Lakhs",
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 16,
                           ),),
                         ],
                       ),
                     ],
                   ),
                 ),
               ),

               Padding(
                 padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                 child: Align(
                   alignment: Alignment.centerLeft,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                      Text("Description:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),

                       SizedBox(
                         height: 6,
                       ),

                       Text("All-India Institute of Medical Sciences was established as an institution of national importance by an Act of Parliament with the objects to develop patterns of teaching in Undergraduate and Post-graduate Medical Education in all its branches so as to demonstrate a high standard of Medical Education in India; to bring together in one place educational facilities of the highest order for the training of personnel in all important branches of health activity; and to attain self-sufficiency in Post-graduate Medical Education.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),

                     ],
                   ),
                 ),
               ),

               Center(
                 child: Container(
                   width: 150,
                   height: 50,
                   child: RaisedButton(
                     onPressed: (){},
                     color: Color(int.parse("0xff${colors_color.main_theme}")),
                     child: Text("Apply",
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


             ],
           ),
         ),
       ),
     );
  }
}