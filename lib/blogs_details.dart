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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          /*title: ClipRRect(
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
          ),*/
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Blogs Details",
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
                   width: MediaQuery.of(context).size.width,
                   height: 230,
                  //color: Colors.pink,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(48), // Image radius
                      child: Image.asset("assets/image/img_1.png", fit: BoxFit.cover),
                    ),
                  )
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

            ],
          ),
        ),
      ),
    );
  }
}