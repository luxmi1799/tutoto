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
          title: Text("Budget Predictor",style: TextStyle(
            color: Colors.black,
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("NEET Score",style: TextStyle(
                          fontSize: 12,
                         fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 40,
                          child: TextFormField(
                            enabled: false,
                            validator: (value) {
                              if (value != null && value.trim().length < 5) {
                                return 'This field requires a minimum of 3 characters';
                              }

                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: '1832983',
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12
                                ),
                                border: OutlineInputBorder(),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.amber,
                                        width: 4))),
                          ),
                        ),
                      ),
                    ],

                  ),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Budget",style: TextStyle(
                          fontSize: 12,
                         fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 40,
                          child: TextFormField(
                            enabled: false,
                            validator: (value) {
                              if (value != null && value.trim().length < 5) {
                                return 'This field requires a minimum of 3 characters';
                              }

                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: '2 Lakhs',
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12
                                ),
                                border: OutlineInputBorder(),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.amber,
                                        width: 4))),
                          ),
                        ),
                      ),
                    ],

                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
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
                  new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  scrollDirection: Axis.vertical,
                  itemCount: 8,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
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
                                    padding: const EdgeInsets.all(5.0),
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
                                    padding: const EdgeInsets.only(left: 5.0,bottom: 5),
                                    child: Text("All India Institute of Medical Science",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Delhi,India",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold
                                          ),),

                                        Text("Rs. 1.8 lakhs",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 10,
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