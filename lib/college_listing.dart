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
           borderRadius: BorderRadius.circular(15.0),
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
               padding: const EdgeInsets.only(left: 8.0),
               child: Align(
                 alignment: Alignment.centerLeft,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [

                     Container(
                       height: 27,
                       // width: 100,
                       // height: 30,
                       // margin: const EdgeInsets.all(12.0),
                       // padding: const EdgeInsets.all(3.0),
                       decoration: BoxDecoration(
                           border: Border.all(
                             color: Color(int.parse("0xff${colors_color.main_theme}")),
                           ),
                         borderRadius: BorderRadius.circular(5),
                       ),
                       child: Center(
                         child: Text(' All ',
                           style: TextStyle(
                             fontSize: 17,
                             fontWeight: FontWeight.bold,
                             color: Color(int.parse("0xff${colors_color.main_theme}")),
                           ),
                         ),
                       ),
                     ),

                     Container(
                       height: 27,
                       // margin: const EdgeInsets.all(12.0),
                       // padding: const EdgeInsets.all(3.0),
                       decoration: BoxDecoration(
                         border: Border.all(
                           color: Color(int.parse("0xff${colors_color.main_theme}")),
                         ),
                         borderRadius: BorderRadius.circular(5),
                       ),
                       child: Center(
                         child: Text(' India ',
                           style: TextStyle(
                             fontSize: 17,
                             fontWeight: FontWeight.bold,
                             color: Color(int.parse("0xff${colors_color.main_theme}")),
                           ),
                         ),
                       ),
                     ),

                     Container(
                       height: 27,
                       // margin: const EdgeInsets.all(12.0),
                       // padding: const EdgeInsets.all(3.0),
                       decoration: BoxDecoration(
                         border: Border.all(
                           color: Color(int.parse("0xff${colors_color.main_theme}")),
                         ),
                         borderRadius: BorderRadius.circular(5),
                       ),
                       child: Center(
                         child: Text(' Abroad ',
                           style: TextStyle(
                             fontSize: 17,
                             fontWeight: FontWeight.bold,
                             color: Color(int.parse("0xff${colors_color.main_theme}")),
                           ),
                         ),
                       ),
                     ),

                    FormField<String>(
                         builder: (FormFieldState<String> state) {
                           return Container(
                             height: 27,
                               // margin: const EdgeInsets.all(12.0),
                               // padding: const EdgeInsets.all(3.0),
                               decoration: BoxDecoration(
                                 border: Border.all(
                                   color: Color(int.parse("0xff${colors_color.main_theme}")),
                                 ),
                                 borderRadius: BorderRadius.circular(5),
                               ),
                             child: DropdownButtonHideUnderline(
                               child: DropdownButton<String>(
                                 hint: Text("Advanced Filter",
                                   style: TextStyle(
                                   fontSize: 14,
                                   fontWeight: FontWeight.bold,
                                   color: Color(int.parse("0xff${colors_color.main_theme}")),
                                 ),),
                                 icon: Icon(                // Add this
                                   Icons.arrow_drop_down,  // Add this
                                   color: Color(int.parse("0xff${colors_color.main_theme}")),  // Add this
                                 ),
                                 value: selectedValue,
                                 isDense: true,
                                 onChanged: (newValue) {
                                   setState(() {
                                     selectedValue = newValue;
                                   });
                                   print(selectedValue);
                                 },
                                 items: _currencies.map((String value) {
                                   return DropdownMenuItem<String>(
                                     value: value,
                                     child: Text(value,
                                       style: TextStyle(
                                         fontSize: 17,
                                         fontWeight: FontWeight.bold,
                                         color: Color(int.parse("0xff${colors_color.main_theme}")),
                                       ),
                                     ),
                                   );
                                 }).toList(),
                               ),
                             ),
                           );
                         },
                       ),

                     // Container(
                     //   margin: const EdgeInsets.all(12.0),
                     //   padding: const EdgeInsets.all(3.0),
                     //   decoration: BoxDecoration(
                     //     border: Border.all(
                     //       color: Color(int.parse("0xff${colors_color.main_theme}")),
                     //     ),
                     //     borderRadius: BorderRadius.circular(5),
                     //   ),
                     //   child: Text('Advanced Filter',
                     //     style: TextStyle(
                     //       fontSize: 17,
                     //       fontWeight: FontWeight.bold,
                     //       color: Color(int.parse("0xff${colors_color.main_theme}")),
                     //     ),
                     //   ),
                     // ),
                   ],
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
                   itemCount: 5,
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
                  Text("All india institute of medical sciences",
                    style: TextStyle(
                      fontSize: 15,
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
                          fontSize: 12,
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
                          fontSize: 13,
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
                          fontSize: 14,
                        color: Color(int.parse("0xff${colors_color.main_theme}")),
                          fontWeight: FontWeight.bold,
                      ),),
                  ),


                ],
              ),
              SizedBox(
                width: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15), // Image border
                child: SizedBox.fromSize(
                  size: Size.fromRadius(48), // Image radius
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