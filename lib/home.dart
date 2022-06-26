

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tutoro/college_listing.dart';
import 'package:tutoro/colors/colors.dart';
import 'package:tutoro/drawer.dart';


final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _home_body();
  }
}

class _home_body extends State<home> {

  int _current = 0;
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
      Scaffold(

        drawer: myDrawer(),
        appBar: AppBar(
         iconTheme: IconThemeData(color: Colors.black),
         backgroundColor: Colors.white,
         elevation: 0.0,
            actions: <Widget>[
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

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    color: Colors.grey[200],
                    // child: Center(
                    child: TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                        //  filled: true,
                        // fillColor: Colors.grey[200],
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(10.0),
                        // ),
                        hintText: 'Search',
                        hintStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                    ),
                    // ),
                  ),
                ),
              ),
              Container(
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
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Categories",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            boxShadow: [BoxShadow(color: Color(int.parse("0xff${colors_color.main_theme}")), blurRadius: 8)],
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
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Align(
                                              child: Text("News",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              )),

                                           Padding(
                                             padding: EdgeInsets.only(top: 8),
                                                child: Text("Get Latest Updates",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10
                                                  ),
                                                )),

                                        ],
                                      ),
                                     SizedBox(
                                       width: 20,
                                     ),
                                      Icon(Icons.home,
                                      color: Colors.white,),
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
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        //width:200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [BoxShadow(color: Color(int.parse("0xff${colors_color.main_theme}")), blurRadius: 8)],
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
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Colleges",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,

                                              ),
                                            )),

                                        Padding(
                                          padding: EdgeInsets.only(top: 8),
                                            child: Text("Top Colleges",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10
                                              ),
                                            )),

                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.home,
                                      color: Colors.white,),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Expanded(
                      child: Container(
                        //width:200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [BoxShadow(color: Color(int.parse("0xff${colors_color.main_theme}")), blurRadius: 8)],
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
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
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
                                   SizedBox(
                                     width: 20,
                                   ),
                                    Icon(Icons.home,
                                    color: Colors.white,),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        //width:200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [BoxShadow(color: Color(int.parse("0xff${colors_color.main_theme}")), blurRadius: 8)],
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
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
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
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.home,
                                      color: Colors.white,),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Latest News",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

            ]),
          ),
        ),
      ),

      //news
      Scaffold(
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
                  child: Text("Blogs List",
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
                padding: EdgeInsets.all(10),
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.

                  child: GridView.builder(
                    gridDelegate:
                    new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                // What do i do here?

                                setState(() {

                                });
                              },
                              child: Container(
                                height: 350,
                                width: 170,
                                decoration: BoxDecoration(
                                  // border: Border.all(color: Color(0xff940D5A)),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(17.0),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(1.0, 15.0),
                                      blurRadius: 20.0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                      Image.asset("assets/image/img_1.png", fit: BoxFit.cover,height: 150,),
                                      Text("Data Science",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                      ),),

                                     SizedBox(
                                       height: 5,
                                     ),

                                     Text("How to improve Excel Skills",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("{U+1F441}20k",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 9,
                                          ),),

                                        Text("28 jan 2021",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 9,
                                          ),),
                                      ],
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
      ),

      //profile
      Text(
        'Index 2: School',
      ),
    ];
     return Scaffold(
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
             icon: Icon(Icons.business),
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

  Widget blogs_list(){
    return IntrinsicHeight(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [

          Column(

          ),

        ],
      ),
    );
  }

}