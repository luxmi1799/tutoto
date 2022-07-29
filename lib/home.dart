

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dot_pagination_swiper/dot_pagination_swiper.dart';
import 'package:flutter/material.dart';
import 'package:tutoro/about_us.dart';
import 'package:tutoro/budget_predictor.dart';
import 'package:tutoro/college_listing.dart';
import 'package:tutoro/colors/colors.dart';
import 'package:tutoro/drawer.dart';
import 'package:tutoro/edit_profile.dart';
import 'package:tutoro/support_screen.dart';

import 'blog_list.dart';
import 'blogs_details.dart';


final List<String> imgList = [
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<String> assetimg= [
  "assets/image/laptop1.png",
  "assets/image/laptop2.png",
  "assets/image/laptop3.png",
  "assets/image/laptop4.png",
  "assets/image/laptop5.png",
  "assets/image/laptop6.png",
  "assets/image/laptop3.png",
  "assets/image/laptop4.png",
];

class home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _home_body();
  }
}

class _home_body extends State<home> {

  bool home = true;
  bool college = false;
  bool news = false;


  int _selectedIndex = 0;
  int counter = 0;
  final CarouselController _controller = CarouselController();

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
    child: Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    'No. ${imgList.indexOf(item)} image',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
    ),
    ))
      .toList();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    final  List<Widget> _widgetOptions = <Widget>[
      //home..
      college_home(context),

      //news
      blog_detail(),

      //profile
      edit_profile()

    ];
     return Scaffold(
       backgroundColor: Colors.white,
       body: Center(
         child: _widgetOptions.elementAt(_selectedIndex),
       ),
       bottomNavigationBar: BottomNavigationBar(
         items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
             icon: Icon(Icons.home),
             label: 'Home',
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.newspaper_sharp),
             label: 'News',
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.school),
             label: 'My Profile',
           ),
         ],
         currentIndex: _selectedIndex,
         selectedItemColor: Colors.amber[800],
         onTap: _onItemTapped,
       ),
     );
  }

  Widget college_home(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Container(
          width:260,child: myDrawer()),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[

          Container(
            width: 30,
            height: 30,
            child: FittedBox(
              fit: BoxFit.contain,
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(int.parse("0xff${colors_color.main_theme}")),
                  border: Border.all(color: Color(int.parse("0xff${colors_color.main_theme}")), width: 0.0),
                ),
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.call,color: Colors.white),
              ),
            ),
          ),
          // Using Stack to show Notification Badge
          new Stack(
            children: <Widget>[
              new IconButton(
                  icon: Icon(
                      Icons.notifications_outlined), onPressed: () {
                setState(() {
                  counter = 0;
                });
              }),
              counter != 1 ? new Positioned(
                right: 11,
                top: 11,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ) : new Container()
            ],
          ),
        ],

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(children: [
            // Expanded(
            //   child:
           /* Container(
              width: MediaQuery.of(context).size.width,
              height: 240,
              child: CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: false,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ),
            //),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 9.0,
                    height: 9.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ), */

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Container(
                height: 240,
                child: DotPaginationSwiper.builder(
                  itemCount: imgList.length,
                  itemBuilder: (context, i) =>
                    //  Center(child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                        child: Image.network(imgList[i], fit: BoxFit.cover,)),
                 // ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Categories",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 7),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => college_list()));

                      },
                      child: Container(
                        //width:200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [BoxShadow(color: Color(int.parse("0xff${colors_color.main_theme}")), blurRadius: 4)],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                                // radius
                              ),
                              // border: Border(
                              //   left: BorderSide(color: Colors.indigo, width: 5),
                              // ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start ,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start ,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                            child: Text("Colleges",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            )),

                                        Padding(
                                            padding: EdgeInsets.only(top: 8),
                                            child: Text("Top Colleges",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10
                                              ),
                                            )),

                                      ],
                                    ),
                                    // SizedBox(
                                    //   width: 20,
                                    // ),
                                    Image.asset("assets/image/college.png", fit: BoxFit.cover),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => blog_detail()));
                      },
                      child: Container(
                        //width:200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [BoxShadow(color: Color(int.parse("0xff${colors_color.main_theme}")), blurRadius: 4)],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                                // radius
                              ),
                              // border: Border(
                              //   left: BorderSide(color: Colors.indigo, width: 5),
                              // ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                //  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start ,
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("News",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,

                                              ),
                                            )),

                                        Padding(
                                            padding: EdgeInsets.only(top: 8),
                                            child: Text("Get Latest Updates",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10
                                              ),
                                            )),

                                      ],
                                    ),
                                    // SizedBox(
                                    //   width: 20,
                                    // ),
                                  Image.asset("assets/image/Vector.png", fit: BoxFit.cover),

                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => budget_predictor()));
                      },
                      child: Container(
                        //width:200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [BoxShadow(color: Color(int.parse("0xff${colors_color.main_theme}")), blurRadius: 4)],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                                // radius
                              ),
                              // border: Border(
                              //   left: BorderSide(color: Colors.indigo, width: 5),
                              // ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start ,
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Budget Predictor",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            )),

                                        Padding(
                                            padding: EdgeInsets.only(top: 8),
                                            child: Text("Control your money",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10
                                              ),
                                            )),

                                      ],
                                    ),
                                    // SizedBox(
                                    //   width: 20,
                                    // ),
                                    Image.asset("assets/image/budget.png", fit: BoxFit.cover),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => support_s()));
                      },
                      child: Container(
                        //width:200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [BoxShadow(color: Color(int.parse("0xff${colors_color.main_theme}")), blurRadius: 4)],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                                // radius
                              ),
                              // border: Border(
                              //   left: BorderSide(color: Colors.indigo, width: 5),
                              // ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start ,
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Support",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12
                                              ),
                                            )),

                                        Padding(
                                            padding: EdgeInsets.only(top: 8),
                                            child: Text("How we help you!",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10
                                              ),
                                            )),

                                      ],
                                    ),
                                    // SizedBox(
                                    //   width: 20,
                                    // ),
                                    Image.asset("assets/image/support.png", fit: BoxFit.cover),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30.0,left: 13),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Latest News",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 0.0),
              height: 180.0,
              child:
              ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: <Widget>[
                  InkWell(
                    onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => blog_details()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(13), // Image border
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(50), // Image radius
                              child: Image.asset("assets/image/img_8.png", fit: BoxFit.cover,height: 60,),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start ,
                          children: [
                            Text("Clinical Doctor",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),),

                            // Align(
                            //   alignment: Alignment.centerLeft,
                            //   child: Text("A young doctor journey",
                            //     // textAlign: TextAlign.left,
                            //     style: TextStyle(
                            //         fontSize: 12,
                            //         color: Colors.grey,
                            //         fontWeight: FontWeight.bold
                            //     ),),
                            // ),

                            SizedBox(
                              height: 5,
                            ),

                            SizedBox(
                              width: 120,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                  child: Text("Lorem Ipsum ispular dummy text generator most popular dummy text generator out there. ...",
                                    // textAlign: TextAlign.left,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ),
                                   maxLines: 4,
                                   overflow: TextOverflow.ellipsis
                                  ),
                              ),
                            ),


                          ],
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => blog_details()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(13), // Image border
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(50), // Image radius
                              child: Image.asset("assets/image/img_7.png", fit: BoxFit.cover,height: 60,),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start ,
                          children: [
                            Text("Clinical Doctor",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),),


                            SizedBox(
                              height: 5,
                            ),

                            SizedBox(
                              width: 120,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                // child: Expanded(
                                child: Text(" Lorem Ipsum is probably  dummy text generator out there. ...",
                                  // textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                 maxLines: 4,
                                 overflow: TextOverflow.ellipsis
                                ),
                                //  ),
                              ),
                            ),


                          ],
                        ),
                      ],
                    ),
                  ),
                ],

              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget profile(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        title: Text("My Profile",style: TextStyle(
            color: Colors.black,
                fontSize: 16
        ),),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(int.parse("0xff${colors_color.main_theme}")),
                          border: Border.all(color: Color(int.parse("0xff${colors_color.main_theme}")), width: 0.0),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Text("L", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),


                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Liza Horllow",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Lizaorllow@gmail.com",
                      style: TextStyle(
                        fontSize: 13,
                      ),),
                    ),
                  ],
                ),

              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                  child: Container(
                    width: 50,
                    height: 50,
                      child: Container(
                        child: Icon(Icons.home_outlined,
                          size: 30,
                          color: Color(int.parse("0xff${colors_color.main_theme}"),),
                        ),
                      ),

                  ),
                ),


                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Home",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                    ),),
                ),

              ],
            ),

            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => about_us()));
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Container(
                        child: Icon(Icons.info_outlined,
                          size: 30,
                          color: Color(int.parse("0xff${colors_color.main_theme}"),),
                        ),
                      ),

                    ),
                  ),


                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("About us",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                      ),),
                  ),

                ],
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => edit_profile()));
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Container(
                        child: Icon(Icons.person_outline,
                          size: 30,
                          color: Color(int.parse("0xff${colors_color.main_theme}"),),
                        ),
                      ),

                    ),
                  ),


                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Edit Profile",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                      ),),
                  ),

                ],
              ),
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Container(
                      child: Icon(Icons.star_border_sharp,
                        size: 30,
                        color: Color(int.parse("0xff${colors_color.main_theme}"),),
                      ),
                    ),

                  ),
                ),


                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Rate App",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                    ),),
                ),

              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Container(
                      child: Icon(Icons.share,
                        size: 30,
                        color: Color(int.parse("0xff${colors_color.main_theme}"),),
                      ),
                    ),

                  ),
                ),


                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Share App",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                    ),),
                ),

              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Container(
                      child: Icon(Icons.privacy_tip_outlined,
                        size: 30,
                        color: Color(int.parse("0xff${colors_color.main_theme}"),),
                      ),
                    ),

                  ),
                ),


                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Privacy Policy",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                    ),),
                ),

              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Container(
                      child: Icon(Icons.logout,
                        size: 30,
                        color: Color(int.parse("0xff${colors_color.main_theme}"),),
                      ),
                    ),

                  ),
                ),


                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Sign Out",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                    ),),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }

}