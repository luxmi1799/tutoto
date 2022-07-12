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
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: AppBar(
          centerTitle: true,
          title: Text("Budget Predictor",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Container(
              color: Color(int.parse("0xff${colors_color.main_theme}")),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.35,
              child:Padding(
                padding: const EdgeInsets.all(18.0),
                child:
                // Center(child:
                Image.asset("assets/image/img_6.png", fit: BoxFit.fill)
                //),
              ),
            ),

            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("NEET Score",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
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
                          color: Colors.white,
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
                                        color: Colors.black,
                                        width: 4))),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 60),
                      child: Center(
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => budget_detail()));
                          },
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),//empty container can use inside of widget
                            height: 50,
                            alignment: Alignment.center,
                            //changebtn?Icon(Icons.done,color: Colors.white,):
                            child:Text("Submit",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            ),
                            decoration: BoxDecoration(
                              color: Color(int.parse("0xff${colors_color.main_theme}")),
                              borderRadius: BorderRadius.circular(10),
                            ),
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