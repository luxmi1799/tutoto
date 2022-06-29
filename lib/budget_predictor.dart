import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoro/budget_predictor_list.dart';
import 'package:tutoro/colors/colors.dart';

class budget_predictor extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _budget();
  }
}

class _budget extends State<budget_predictor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: AppBar(
          title: Text("",style: TextStyle(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Budget Predictor",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            Container(
              color: Color(int.parse("0xff${colors_color.main_theme}")),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.40,
              child:Padding(
                padding: const EdgeInsets.all(18.0),
                child:
                // Center(child:
                Image.asset("assets/image/img_2.png", fit: BoxFit.fill)
                //),
              ),
            ),

            Container(
              color: Colors.amberAccent,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("NEET Score",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                    Container(
                    //  color: Color(int.parse("0xff${colors_color.main_theme}")),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          color: Colors.amberAccent,
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.trim().length < 5) {
                                return 'This field requires a minimum of 3 characters';
                              }

                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: 'Enter NEET Score',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14
                                ),
                                border: OutlineInputBorder(),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.amber,
                                        width: 4))),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Center(
                        child: Container(
                          width: 150,
                          height: 50,
                          child: RaisedButton(
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => budget_detail()));
                            },
                            color: Color(int.parse("0xff${colors_color.main_theme}")),
                            child: Text("Submit",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                backgroundColor:  Color(int.parse("0xff${colors_color.main_theme}")),
                              ),),
                          ),
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
    );
  }
}