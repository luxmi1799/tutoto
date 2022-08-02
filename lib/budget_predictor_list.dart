import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'college_details.dart';

class budget_detail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _budget_d();
  }
}

class _budget_d extends State<budget_detail> {

  var rank;
  var getdata;
  var fee ;

  @override
  void initState() {
    super.initState();
    rank_detail(context);
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        print("222");
        college_list_detail(rank);
      });
    });
  }

  rank_detail(BuildContext context) async{
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
    print("score$rank");
    setState(() {
      rank = prefs.getString('score')!;
    });
    print("score$rank");
  }

  void college_list_detail(String rank) async {
    String postUrl = "https://tutoro.co.in/mobile-authenticate/budget-predictor.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['rank'] = rank;
    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          Navigator.pop(context);
          print("onValue${onValue.body}");
          Map mapRes = json.decode(onValue.body);
          var collegedetail= mapRes["commandResult"]["data"]["CollegeDetail"];
          fee =  mapRes["commandResult"]["data"]["Budget"]["Fee"];
          setState(() {
            getdata = collegedetail;
          });
          print("getdatata${getdata})");
          print('dataa${getdata[0]["CollegeId"]}');
          print("mapRes${mapRes["commandResult"]["data"]["Budget"]}");

        } catch (e) {
          print("response$e");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: AppBar(
          centerTitle: true,
          title: Text("Budget Predictor",style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),),
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
            getdata==null?Container(color: Colors.white,):  Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                      child: Text("The above fees mentioned in tution fee only for complete duration of MBBS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 15,
                    ),),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text("NEET Score",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                fontSize: 18,
                               fontWeight: FontWeight.bold,
                              ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                width: 120,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(4)
                                ),
                                child: Center(
                                    child: Text(
                                      rank,
                                      style: TextStyle(
                                          fontSize: 18
                                      ),
                                    )
                                ),
                              ),
                            ),
                          ],

                        ),

                        SizedBox(
                          width: 40,
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text("Budget",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                fontSize: 18,
                               fontWeight: FontWeight.bold,
                              ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                width: 120,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(4)
                                ),
                                child: Center(
                                  child: Text(
                                    fee,
                                    style: TextStyle(
                                      fontSize: 18
                                    ),
                                  )
                                ),
                              ),
                            ),
                          ],

                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Recommended College List",
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
                            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                GestureDetector(
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
                                  child: Container(
                                    height: 340,
                                    width: MediaQuery.of(context).size.width*0.45,
                                    decoration: BoxDecoration(
                                      // border: Border.all(color: Color(0xff940D5A)),
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 7),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10), // Image border
                                            child: Image.network("${getdata[index]["Image"]}",
                                              fit: BoxFit.cover,
                                              height: 120,
                                              width: MediaQuery.of(context).size.width*0.45,
                                            ),
                                          ),
                                        ),


                                        Padding(
                                          padding: const EdgeInsets.only(left: 10.0,bottom: 5,right: 10),
                                          child: Text("${getdata[index]["Name"]}",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10.0,bottom: 5,),
                                          child: Row(
                                            children: [
                                              Text("Delhi,India",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold
                                                ),),

                                              SizedBox(
                                                width: 10,
                                              ),

                                              Text("Rs. ${getdata[index]["Fee"]}",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold
                                                ),),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
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
          ],
        ),
      ),
    );
  }
}