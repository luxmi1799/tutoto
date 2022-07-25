import 'package:flutter/material.dart';

class budget_detail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _budget_d();
  }
}

class _budget_d extends State<budget_detail> {
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text("NEET Score",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                          fontSize: 20,
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
                                "1234678",
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text("Budget",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                          fontSize: 20,
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
                              "2 Lakhs",
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
                  itemCount: 8,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              // What do i do here?
                              setState(()
                              {

                              });
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
                                      child: Image.asset("assets/image/img_9.png",
                                        fit: BoxFit.cover,
                                        height: 120,
                                        width: MediaQuery.of(context).size.width*0.45,
                                      ),
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0,bottom: 5),
                                    child: Text("All India Institute of Medical Science",
                                      textAlign: TextAlign.left,
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

                                        Text("Rs. 1.8 lakhs",
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
    );
  }
}