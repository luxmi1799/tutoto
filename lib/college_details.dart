import 'package:dot_pagination_swiper/dot_pagination_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:tutoro/colors/colors.dart';


final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

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
         appBar: PreferredSize(
           preferredSize: Size.fromHeight(50.0), // here the desired height
           child: AppBar(
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
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
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
                 padding: const EdgeInsets.symmetric(vertical: 12.0),
                 child: Container(
                   height: 220,
                   child: DotPaginationSwiper.builder(
                     itemCount: imgList.length,
                     itemBuilder: (context, i) =>
                     //  Center(child:
                     ClipRRect(
                         borderRadius: BorderRadius.circular(10),
                         child: Image.asset("assets/image/img_1.png", fit: BoxFit.cover)),
                     // ),
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
                 padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 20),
                 child: Align(
                   alignment: Alignment.centerLeft,
                   child: Text("Delhi",
                     textAlign: TextAlign.start,
                     style: TextStyle(
                       fontSize: 16,
                       color: Colors.grey,
                       fontWeight: FontWeight.bold
                     ),
                   ),
                 ),
               ),

               Padding(
                 padding: EdgeInsets.symmetric(vertical: 3.0,horizontal: 20),
                 child: Align(
                   alignment: Alignment.centerLeft,
                   child: Text("4.5",
                     textAlign: TextAlign.start,
                     style: TextStyle(
                       fontSize: 16,
                       color: Colors.grey,
                       fontWeight: FontWeight.bold
                     ),
                   ),
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.only(left: 10.0,top: 5),
                 child: Table(
                     border: TableBorder.all(width: 0.001), // Allows to add a border decoration around your table
                     children: [

                       TableRow(children :[
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child:
                           Text('World Ranking',style: TextStyle(
                             fontSize: 15,
                             fontWeight: FontWeight.bold,
                           ),),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child: Text('8234 Rank',
                             style: TextStyle(
                               fontSize: 15,
                             ),),
                         ),
                       ]),
                       TableRow(children :[
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child: Text('Bond',style: TextStyle(
                             fontSize: 15,
                             fontWeight: FontWeight.bold,
                           ),),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child: Text('-',
                             style: TextStyle(
                               fontSize: 15,
                             ),),
                         ),
                       ]),

                       TableRow(children :[
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child: Text('Private/Government',style: TextStyle(
                             fontSize: 15,
                             fontWeight: FontWeight.bold,
                           ),),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child: Text('Private',
                             style: TextStyle(
                               fontSize: 15,
                             ),),
                         ),
                       ]),



                       TableRow(children :[
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child: Text('Institute Fee/Hostel Fee',style: TextStyle(
                             fontSize: 15,
                             fontWeight: FontWeight.bold,
                           ),),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child: Text('2 Lakhs',
                             style: TextStyle(
                               fontSize: 15,
                             ),),
                         ),
                       ]),


                     ]
                 ),
               ),

               Padding(
                 padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                 child: Align(
                   alignment: Alignment.centerLeft,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
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

                       SizedBox(
                         width: MediaQuery.of(context).size.width,
                         child: Text("All-India Institute of Medical Sciences was established as an institution of national importance by an Act of Parliament with the objects to develop patterns of teaching in Undergraduate and Post-graduate Medical Education in all its branches so as to demonstrate a high standard of Medical Education in India; to bring together in one place educational facilities of the highest order for the training of personnel in all important branches of health activity; and to attain self-sufficiency in Post-graduate Medical Education.",
                          softWrap: true,
                           style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          maxLines: 10,
                         overflow: TextOverflow.ellipsis
                        ),
                       ),

                     ],
                   ),
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Center(
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
               ),


             ],
           ),
         ),
       ),
     );
  }
}