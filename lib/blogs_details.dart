import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class blog_details extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _college_details();
  }
}

class _college_details extends State<blog_details> {

  var blog_id = '';
  var getdata;

  @override
  void initState() {
    super.initState();
    blod_id_detail(context);
  }

  blod_id_detail(BuildContext context) async{
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
    print("blog_id$blog_id");
    setState(() {
      blog_id = prefs.getString('blog_id')!;
    });
    setState(() {
      blog_list(blog_id);
    });
  }


  void blog_list(String imagePath) async {
    String postUrl = "https://tutoro.co.in/mobile-authenticate/blog-detail.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['blogId'] = imagePath;
    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          Navigator.pop(context);
          print("onValue${onValue.body}");
          Map mapRes = json.decode(onValue.body);
          var blogdetail= mapRes["commandResult"]["data"]["BlogDetail"];
          setState(() {
            getdata = blogdetail;
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
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child:AppBar(
            centerTitle: true,
            title: Text("Blog Details",
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
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 10,right: 10),
                child: Container(
                  //height: MediaQuery.of(context).size.height*0.75,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Color(0xff940D5A)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(1.0, 15.0),
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(10)), // Image border
                        child: Image.network("${getdata["Image"]}",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),

                     /* Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Clinical Data",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),*/

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${getdata["Heading"]}",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                            ),

                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.remove_red_eye,size: 15,color: Colors.grey[600],),
                                    Text(" 20k",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  width: 7,
                                ),

                                Text("${getdata["BlogDate"]}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 10),
                      //   child: SizedBox(
                      //     width: MediaQuery.of(context).size.width,
                      //     child: Text(
                      //         "${getdata["Description"]}",
                      //         softWrap: true,
                      //         style: TextStyle(
                      //           color: Colors.grey,
                      //           fontSize: 15,
                      //         ),
                      //         maxLines: 7,
                      //         overflow: TextOverflow.ellipsis
                      //     ),
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 10),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child:  Html(data:"${getdata["Description"]}",
                            style: {
                              "table": Style(
                                backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                              ),
                              "tr": Style(
                                border: Border(bottom: BorderSide(color: Colors.grey)),
                              ),
                              "th": Style(
                                padding: EdgeInsets.all(6),
                                backgroundColor: Colors.grey,
                              ),
                              "td": Style(
                                padding: EdgeInsets.all(6),
                                alignment: Alignment.topLeft,
                              ),
                              'h5': Style( textOverflow: TextOverflow.ellipsis,color: Colors.grey[200]),
                            },
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
}