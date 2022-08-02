import 'dart:convert';
import 'dart:ui';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:dot_pagination_swiper/dot_pagination_swiper.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutoro/applyloan.dart';
import 'package:tutoro/colors/colors.dart';



class college_details extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
      return _college_details();
  }
}

class _college_details extends State<college_details> {
  List imglist =[];
  var image1;
  var college_id;
  var getdata;
  var user_id;
  bool bookmark = false;
  PageController? controller;
  GlobalKey<PageContainerState> key = GlobalKey();


  @override
  void initState() {
    super.initState();
    college_id_detail(context);
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        print("222");
        college_list_detail(college_id,user_id);
      });
    });
  }

  college_id_detail(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return new BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child:  AlertDialog(
              content: Row(children: [
                CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
                Container(margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
              ]),
            )
        );
      },
    );
    print("college_id$college_id");
    setState(() {
      college_id = prefs.getString('collegeId')!;
      user_id = prefs.getString("user_id")!;
    });
  }

  void college_list_detail(String collegeId,String user_id) async {
    String postUrl = "https://tutoro.co.in/mobile-authenticate/college-detail.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['collegeId'] = collegeId;
    request.fields['UserId'] = user_id;
    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          Navigator.pop(context);
          print("onValue${onValue.body}");
          Map mapRes = json.decode(onValue.body);
          var collegedetail= mapRes["commandResult"]["data"]["CollegeDetail"];
          setState(() {
            getdata = collegedetail;
          });
          setState(() {
            image1 = getdata["Image"];
            imglist = getdata["image"];
            imglist.insert(0, image1);
          });
          print("getdatata$getdata)");
          print("img1$image1");
          print("imglist$imglist");

        } catch (e) {
          print("response$e");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Material(
       child: Scaffold(
         bottomNavigationBar:  Container(
           color: Colors.white,
           height: 65,
           child: Padding(
             padding: const EdgeInsets.all(10.0),
             child: Center(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                     width: 150,
                     height: 50,
                     child: RaisedButton(
                       onPressed: () async {
                         SharedPreferences prefs = await SharedPreferences.getInstance();
                         setState(()
                         {
                           prefs.setString("collegeName","${getdata["Name"]}");
                           print("collegeName${getdata["Name"]}");
                         });
                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => applyloan()));
                       },
                       color: Color(int.parse("0xff${colors_color.main_theme}")),
                       child: Text("Apply",
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 18,
                           fontWeight: FontWeight.bold,
                           backgroundColor:  Color(int.parse("0xff${colors_color.main_theme}")),
                         ),),
                     ),
                   ),

                   SizedBox(
                     width: 10,
                   ),

                   InkWell(
                     onTap: (){
                       setState(() {
                         bookmark = true;
                       });
                     },
                     child: Container(
                       width: 35,
                       height: 50,
                       child: FittedBox(
                         fit: BoxFit.contain,
                         alignment: Alignment.center,
                         child: Container(
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                             boxShadow: <BoxShadow>[
                               BoxShadow(
                                 color: Colors.grey,
                                 blurRadius: 1.0,
                               ),
                             ],
                             shape: BoxShape.rectangle,
                             color: Colors.white,
                             border: Border.all(color: Color(int.parse("0xff${colors_color.main_theme}")), width: 0.0),
                             borderRadius: BorderRadius.circular(4)
                           ),
                           padding: EdgeInsets.all(8.0),
                           child: StarButton(
                             isStarred: false,
                             iconColor: Color(0xffECAE0F),
                             //iconDisabledColor: Colors.white,
                             valueChanged: (_isStarred) {
                               bookmark = _isStarred;
                               bookmark_list(college_id, user_id);
                               print('Is Starred : $_isStarred $bookmark');
                             },
                           ),
                           //child: Icon(Icons.star,color: bookmark ==false?Colors.white:Color(0xffECAE0F)),
                         ),
                       ),
                     ),
                   ),

                 ],
               ),
             ),
           ),
         ),
         backgroundColor: Colors.white,
         appBar: PreferredSize(
           preferredSize: Size.fromHeight(40.0), // here the desired height
           child: AppBar(
             centerTitle: true,
             title: Text("College Details",
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
         ),
         body: SingleChildScrollView(
           child: Column(
             children: [
               getdata==null?Container(color: Colors.white,):
               Padding(
                 padding: const EdgeInsets.all(0.0),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(top: 35.0,bottom: 20),
                       child: Container(
                         height: 220,
                         child: DotPaginationSwiper.builder(
                           itemCount: imglist.length,
                           itemBuilder: (context, i) =>
                           //  Center(child:
                           ClipRRect(
                               borderRadius: BorderRadius.circular(4),
                               child: Image.network("${imglist[i]}", fit: BoxFit.cover)),
                           // ),
                         ),
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 20),
                       child: Align(
                         alignment: Alignment.centerLeft,
                         child: Text("${getdata["Name"]}",
                           textAlign: TextAlign.start,
                           style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                             color: Colors.black,
                           ),
                         ),
                       ),
                     ),
                     Row(
                       children: [
                         Padding(
                           padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20),
                           child: Align(
                             alignment: Alignment.centerLeft,
                             child: Text("${getdata["Location"]}",
                               textAlign: TextAlign.start,
                               style: TextStyle(
                                 fontSize: 16,
                                 color: Colors.grey,
                               ),
                             ),
                           ),
                         ),
                         SizedBox(
                           width: 10,
                         ),
                         Padding(
                           padding: EdgeInsets.symmetric(vertical: 3.0,horizontal: 0),
                           child: Align(
                             alignment: Alignment.centerLeft,
                             child: Text("${getdata["Rating"]}",
                               textAlign: TextAlign.start,
                               style: TextStyle(
                                   fontSize: 16,
                                   color: Colors.grey,
                               ),
                             ),
                           ),
                         ),
                         Align(
                             alignment: Alignment.center,
                             child: Icon(Icons.star,
                               color: Color(int.parse("0xff${colors_color.main_theme}")),
                               size: 15,
                             )),
                       ],
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 10.0,top: 10),
                       child: Table(
                           border: TableBorder.all(width: 0.001), // Allows to add a border decoration around your table
                           children: [

                             TableRow(children :[
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                 child:
                                 Text('World Ranking',style: TextStyle(
                                   fontSize: 15,
                                   fontWeight: FontWeight.bold,
                                 ),),
                               ),
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                 child: Text('${getdata["Rank"]} Rank',
                                   style: TextStyle(
                                     fontSize: 15,
                                   ),),
                               ),
                             ]),

                             TableRow(children :[
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                 child: Text('Bond',style: TextStyle(
                                   fontSize: 15,
                                   fontWeight: FontWeight.bold,
                                 ),),
                               ),
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                 child: Text('${getdata["Bond"]}',
                                   style: TextStyle(
                                     fontSize: 15,
                                   ),),
                               ),
                             ]),

                             TableRow(children :[
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                 child: Text('Private/Government',style: TextStyle(
                                   fontSize: 15,
                                   fontWeight: FontWeight.bold,
                                 ),),
                               ),
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                 child: Text('${getdata["Type"]}',
                                   style: TextStyle(
                                     fontSize: 15,
                                   ),),
                               ),
                             ]),

                             TableRow(children :[
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                 child: Text('Institute Fee/Hostel Fee',style: TextStyle(
                                   fontSize: 15,
                                   fontWeight: FontWeight.bold,
                                 ),),
                               ),
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                 child: Text('Rs. ${getdata["Fee"]}',
                                   style: TextStyle(
                                     fontSize: 15,
                                   ),),
                               ),
                             ]),


                           ]
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
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
                               height: 10,
                             ),

                             SizedBox(
                               width: MediaQuery.of(context).size.width,
                               child:
                               Html(data:"${getdata["Description"]}",
                                 style: {
                                   "body": Style(
                                     fontSize: FontSize(15.0),
                                     textAlign: TextAlign.justify,
                                     // fontWeight: FontWeight.bold,
                                     color: Colors.grey,
                                   ),
                                 },
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
       ),
     );
  }
  void bookmark_list(String college_id,String user_id) async {
    String postUrl = "https://tutoro.co.in/mobile-authenticate/save-bookmark.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['CollegeId'] = college_id;
    request.fields['UserId'] = user_id;

    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          print("onValue${onValue.body}");
          Map mapRes = json.decode(onValue.body);
          var success= mapRes["commandResult"]["success"];
          var msg = mapRes["commandResult"]["message"];
          if(success == 1){
            Fluttertoast.showToast(
                msg: msg,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1
            );
          }
          else {
            Fluttertoast.showToast(
                msg: msg,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1
            );
          }
        } catch (e) {
          print("response$e");
        }
      });
    });
  }
}