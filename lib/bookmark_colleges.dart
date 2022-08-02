import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutoro/college_details.dart';
import 'package:tutoro/colors/colors.dart';


class bookmark_list extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _college_list();
  }
}

class _college_list extends State<bookmark_list> {

  List getdata = [];
  String? selectedValue;
  var user_id;


  @override
  void initState() {
    super.initState();
    college_id_detail(context);
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        print("222");
        college_list_detail(user_id);
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
    setState(() {
      user_id = prefs.getString("user_id")!;
    });
  }

  void college_list_detail(String user_id) async {
    String postUrl = "https://tutoro.co.in/mobile-authenticate/bookmark-list.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
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
          print("getdatata$getdata)");

        } catch (e) {
          print("response$e");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
       // automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
         title: Text("Bookmark College",
           textAlign: TextAlign.start,
           style: TextStyle(
             fontSize: 22,
             fontWeight: FontWeight.bold,
             color: Colors.black,
           ),
         ),
         /* title: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            width: double.infinity,
            height: 45,
            color: Colors.grey[200],
            // child: Center(
            child: TextField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 10),
                //  filled: true,
                // fillColor: Colors.grey[200],
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(10.0),
                // ),
                hintText: 'Search',
                hintStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                suffixIcon: Icon(Icons.search,color: Colors.black,),
                prefixIcon: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon:Icon(Icons.arrow_back,color: Colors.black,)),
              ),
            ),
            // ),
          ),
        ), */
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 13),
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: ListView.builder(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: getdata.length,
                  itemExtent: 110.0,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return InkWell(
                        onTap: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          setState(()
                          {
                            prefs.setString("collegeId","${getdata[index]["CollegeId"]}");
                            print("collegeId${getdata[index]["collegeId"]}");
                          });
                          Future.delayed(Duration(seconds: 1));
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => college_details()));
                        },
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start ,
                                    children: [
                                      SizedBox(
                                        width:MediaQuery.of(context).size.width *0.6,
                                        child: Text("${getdata[index]["Name"]}",
                                          textAlign: TextAlign.justify,
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                      ),

                                      SizedBox(
                                        height: 5,
                                      ),

                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("${getdata[index]["Location"]}",
                                          // textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey,
                                          ),),
                                      ),

                                      SizedBox(
                                        height: 5,
                                      ),

                                      Wrap(
                                        children: [
                                          Text("${getdata[index]["Rating"]}",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Icon(Icons.star,
                                                color: Color(int.parse("0xff${colors_color.main_theme}")),
                                                size: 15,
                                              )),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("${getdata[index]["ShortDescription"]}",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 5,
                                      ),

                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Explore Details",
                                          // textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(int.parse("0xff${colors_color.main_theme}")),
                                          ),),
                                      ),


                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10), // Image border
                                    child: SizedBox.fromSize(
                                      size: Size.fromRadius(44
                                      ), // Image radius
                                      child: Image.network("${getdata[index]["Image"]}", fit: BoxFit.cover),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                    );
                  }),
            ),

          ],
        ),
      ),
    );
  }

  Widget college_list(int pos){
    return IntrinsicHeight(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Text("${getdata[pos]["Heading"]}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),),

                  SizedBox(
                    height: 5,
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Delhi,India",
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),),
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  Wrap(
                    children: [
                      Text("4.5",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.star,
                            color: Color(int.parse("0xff${colors_color.main_theme}")),
                            size: 15,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Graduation rate 98%",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Explore Details",
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(int.parse("0xff${colors_color.main_theme}")),
                      ),),
                  ),


                ],
              ),
              SizedBox(
                width: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10), // Image border
                child: SizedBox.fromSize(
                  size: Size.fromRadius(44
                  ), // Image radius
                  child: Image.asset("assets/image/img_9.png", fit: BoxFit.cover),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}