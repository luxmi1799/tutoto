import 'package:flutter/material.dart';
import 'package:tutoro/colors/colors.dart';

class blog_details extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _college_details();
  }
}

class _college_details extends State<blog_details> {

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
                padding: const EdgeInsets.only(top: 20.0,left: 15,right: 15),
                child: Container(
                  height: MediaQuery.of(context).size.height*0.75,
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
                        child: Image.asset("assets/image/img_1.png",
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
                            Text("A Young Doctor's Journey",
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

                                Text("28 jan 2021",
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

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text("All-India Institute of Medical Sciences was established as an institution of national importance by an Act of Parliament with the objects to develop patterns of teaching in Undergraduate and Post-graduate Medical Education in all its branches so as to demonstrate a high standard of Medical Education in India; to bring together in one place educational facilities of the highest order for the training of personnel in all important branches of health activity; and to attain self-sufficiency in Post-graduate Medical Education.",
                              softWrap: true,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                              maxLines: 7,
                              overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text("All-India Institn institution Parliament with the objects to develop patterns of teaching in Undergraduate and Post-graduate Medical Education in all its branches so as to demonstrate a high standard of Medical Education in India; to bring together in one place educational facilities of the highest order for the training of personnel in all important branches of health activity; and to attain self-sufficiency in Post-graduate Medical Education.",
                              softWrap: true,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                              maxLines: 7,
                              overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ),

                    ],
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