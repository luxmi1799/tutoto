import 'package:flutter/material.dart';
import 'package:tutoro/college_details.dart';
import 'package:tutoro/colors/colors.dart';

List<String> college_name = ["All India Institute of Medical Sciences","Harvard University","university of cambride","harvard"];
List<String> address  = ["Delhi,India","Cambrigde,United States","cambridge","cambridge"];



class college_list extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _college_list();
  }
}

class _college_list extends State<college_list> {

  var _currencies = [
    "Food",
    "Transport",
    "Personal",
  ];
  String? selectedValue;
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
             height: 40,
             color: Colors.grey[200],
             // child: Center(
               child: TextField(
                 textAlign: TextAlign.start,
                 decoration: InputDecoration(

                   contentPadding: EdgeInsets.only(top: 5),
                 //  filled: true,
                   // fillColor: Colors.grey[200],
                   // border: OutlineInputBorder(
                   //   borderRadius: BorderRadius.circular(10.0),
                   // ),
                   hintText: 'Search',
                   hintStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                   suffixIcon: Icon(Icons.search,color: Colors.black,),
                   prefixIcon: Icon(Icons.arrow_back,color: Colors.black,),
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
               padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
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

             Wrap(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [

                 Container(
                   margin: const EdgeInsets.all(10.0),
                   padding: const EdgeInsets.all(3.0),
                   decoration: BoxDecoration(
                       border: Border.all(
                         color: Color(int.parse("0xff${colors_color.main_theme}")),
                       ),
                     borderRadius: BorderRadius.circular(5),
                   ),
                   child: Text(' All ',
                     style: TextStyle(
                       fontSize: 17,
                       fontWeight: FontWeight.bold,
                       color: Color(int.parse("0xff${colors_color.main_theme}")),
                     ),
                   ),
                 ),

                 Container(
                   margin: const EdgeInsets.all(10.0),
                   padding: const EdgeInsets.all(3.0),
                   decoration: BoxDecoration(
                     border: Border.all(
                       color: Color(int.parse("0xff${colors_color.main_theme}")),
                     ),
                     borderRadius: BorderRadius.circular(5),
                   ),
                   child: Text(' India ',
                     style: TextStyle(
                       fontSize: 17,
                       fontWeight: FontWeight.bold,
                       color: Color(int.parse("0xff${colors_color.main_theme}")),
                     ),
                   ),
                 ),

                 Container(
                   margin: const EdgeInsets.all(10.0),
                   padding: const EdgeInsets.all(3.0),
                   decoration: BoxDecoration(
                     border: Border.all(
                       color: Color(int.parse("0xff${colors_color.main_theme}")),
                     ),
                     borderRadius: BorderRadius.circular(5),
                   ),
                   child: Text(' Abroad ',
                     style: TextStyle(
                       fontSize: 17,
                       fontWeight: FontWeight.bold,
                       color: Color(int.parse("0xff${colors_color.main_theme}")),
                     ),
                   ),
                 ),

                 Container(
                   margin: const EdgeInsets.all(10.0),
                   padding: const EdgeInsets.all(3.0),
                   decoration: BoxDecoration(
                     border: Border.all(
                       color: Color(int.parse("0xff${colors_color.main_theme}")),
                     ),
                     borderRadius: BorderRadius.circular(5),
                   ),
                   child: Text('Advanced Filter',
                     style: TextStyle(
                       fontSize: 17,
                       fontWeight: FontWeight.bold,
                       color: Color(int.parse("0xff${colors_color.main_theme}")),
                     ),
                   ),
                 ),
               ],
             ),

             Padding(
               padding: EdgeInsets.all(10),
               // Center is a layout widget. It takes a single child and positions it
               // in the middle of the parent.
               child: ListView.builder(
                   physics: NeverScrollableScrollPhysics(),
                   scrollDirection: Axis.vertical,
                   itemCount: 8,
                   itemExtent: 110.0,
                   shrinkWrap: true,
                   itemBuilder: (context,index){
                     return InkWell(
                         onTap: (){
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) => college_details()));
                         },
                         child: college_list());
                   }),
             ),
           ],
         ),
       ),
     );
  }

  Widget college_list(){
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
                  Text("college_name",
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
                    child: Text("address,India",
                     // textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                      ),),
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  Wrap(
                    children: [
                      Text("4.5",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
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
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
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
                          fontSize: 12,
                        color: Color(int.parse("0xff${colors_color.main_theme}")),
                          fontWeight: FontWeight.bold,
                      ),),
                  ),


                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  size: Size.fromRadius(48), // Image radius
                  child: Image.asset("assets/image/img_1.png", fit: BoxFit.cover),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}