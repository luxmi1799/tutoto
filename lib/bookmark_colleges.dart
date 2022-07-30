import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutoro/college_details.dart';
import 'package:tutoro/colors/colors.dart';

List<String> college_name = ["All India Institute of Medical Sciences","Harvard University","university of cambride","harvard"];
List<String> address  = ["Delhi,India","Cambrigde,United States","cambridge","cambridge"];



class bookmark_list extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _college_list();
  }
}

class _college_list extends State<bookmark_list> {

  List getdata = [];
  var _currencies = [
    "Delhi",
    "Uttar Pradesh",
    "Mumbai",
  ];
  String? selectedValue;
  String select = "first";

  @override
  void initState() {
    super.initState();
    college_list_api(context);
  }

  college_list_api(BuildContext context) async{
    var theory_url = 'https://tutoro.co.in/mobile-authenticate/college-list.php';
    var response = await http.post(Uri.parse(theory_url));
    Map mapRes = json.decode(response.body);
    print('Response from server: $mapRes');
    var bloglists = mapRes["commandResult"]["data"]["CollegeList"];
    print("bloglists$bloglists");
    setState(() {
      getdata = bloglists;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: ClipRRect(
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
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("College Listing",
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
                                        child: Text("${getdata[index]["Heading"]}",
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