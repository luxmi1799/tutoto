import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

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
           title: Container(
             width: double.infinity,
             height: 40,
             color: Colors.grey[200],
             // child: Center(
             child: TextField(
               textAlign: TextAlign.start,
               decoration: InputDecoration(

                 contentPadding: EdgeInsets.only(top: 15),
                 filled: true,
                 // fillColor: Colors.grey[200],
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10.0),
                 ),
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
             ],
           ),
         ),
       ),
     );
  }
}