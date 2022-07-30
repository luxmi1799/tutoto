import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tutoro/loding_bar.dart';
import 'blogs_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class blog_detail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _blog_list();
  }
}

class _blog_list extends State<blog_detail> {

  List getdata = [];
  String blog_id = '';

  @override
  void initState() {
    super.initState();
    blog_list(context);
  }

  blog_list(BuildContext context) async{
    var theory_url = 'https://tutoro.co.in/mobile-authenticate/blog-list.php';
    var response = await http.post(Uri.parse(theory_url));
    Map mapRes = json.decode(response.body);
    print('Response from server: $mapRes');
    var bloglists = mapRes["commandResult"]["data"]["BlogList"];
    print("bloglists$bloglists");
    setState(() {
      getdata = bloglists;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Blogs List",
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
        automaticallyImplyLeading: false,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 10),
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.

                child: GridView.builder(
                  gridDelegate:
                  new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 210),
                  scrollDirection: Axis.vertical,
                  itemCount: getdata.length,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () async {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              setState(()
                              {
                                prefs.setString("blog_id","${getdata[index]["BlogId"]}");
                                print("BlogId${getdata[index]["BlogId"]}");
                              });
                              Future.delayed(Duration(seconds: 1));
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => blog_details()));
                            },
                            //  child: SingleChildScrollView(
                            child: Container(
                              //  height: 380,
                              width: MediaQuery.of(context).size.width*0.45,
                              decoration: BoxDecoration(
                                // border: Border.all(color: Color(0xff940D5A)),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)), // Image border
                                    child: Image.network("${getdata[index]["Image"]}",
                                      height: 110,
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width*0.45,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0,left: 7,right: 5),
                                    child: Text("${getdata[index]["Heading"]}".toCapitalized(),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                      ),),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(left: 7.0,right: 7,top: 5),
                                    child: Text("${getdata[index]["ShortDescription"]}".toCapitalized(),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                     maxLines: 2,
                                     overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0,left: 7,right: 7,bottom: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.remove_red_eye,size: 15,color: Colors.grey[600],),
                                            Text("  20k",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold
                                              ),),
                                          ],
                                        ),

                                        SizedBox(
                                          width: 25,
                                        ),

                                        Text("${getdata[index]["BlogDate"]}",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            // ),
                          ),
                        ],
                      ),
                    );
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}