import 'package:flutter/material.dart';

class about_us extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     return _about_us();
  }
}

class _about_us extends State<about_us> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
       backgroundColor: Colors.white,
       appBar: PreferredSize(
         preferredSize: Size.fromHeight(50.0), // here the desired height
         child: AppBar(
           title: Text("About us",style: TextStyle(
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
               padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 12),
               child: Align(
                 alignment: Alignment.centerLeft,
                 child: Text("Start Your Search With Us",
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
               padding: const EdgeInsets.only(top: 10.0),
               child: Align(
                 alignment: Alignment.centerLeft,
                 child: Image.asset("assets/image/new.jpg",
                   width: MediaQuery.of(context).size.width * 0.8,
                   height: 250,
                   fit: BoxFit.cover,
                 ),
               ),
             ),

             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 15),
               child: Text("About Tutoro",
                 textAlign: TextAlign.start,
                 style: TextStyle(
                     fontSize: 18,
                     color: Colors.black,
                     fontWeight: FontWeight.bold
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 12),
               child: SizedBox(
                 width: MediaQuery.of(context).size.width,
                 child: Text("All-India Institute of Medical Sciences was established as an institution of national importance by an Act of Parliament with the objects to develop patterns of teaching in Undergraduate and Post-graduate Medical Education in all its branches so as to demonstrate a high standard of Medical Education in India; to bring together in one place educational facilities of the highest order for the training of personnel in all important branches of health activity; and to attain self-sufficiency in Post-graduate Medical Education.",
                     softWrap: true,
                     style: TextStyle(
                       color: Colors.grey[600],
                       fontSize: 14,
                     ),
                     maxLines: 8,
                     overflow: TextOverflow.ellipsis
                 ),
               ),
             ),

             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 15),
               child: Text("Why Choose Us?",
                 textAlign: TextAlign.start,
                 style: TextStyle(
                     fontSize: 18,
                     color: Colors.black,
                     fontWeight: FontWeight.bold
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
               child: SizedBox(
                 width: MediaQuery.of(context).size.width,
                 child: Text("All-India Institute of Medical Sciences was established as ndia Institute of Medical Sciences was established as an institution of national importance by an Act of Parliament with the objects to develop patterns of teaching in Undergraduate and Post-graduate Medical Education in all its branches so as to demonstrate a high standard of Medical Education in India; to bring together in one place educational facilities of the highest order for the training of personnel in all important branches of health activity; and to attain self-sufficiency in Post-graduate Medical Education.",
                     softWrap: true,
                     style: TextStyle(
                       color: Colors.grey[600],
                       fontSize: 14,
                     ),
                     maxLines: 10,
                     overflow: TextOverflow.ellipsis
                 ),
               ),
             ),

           ],
         ),
       ),
     );
  }
}