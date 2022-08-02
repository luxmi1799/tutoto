import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutoro/colors/colors.dart';
import 'package:tutoro/home.dart';
import 'package:tutoro/loding_bar.dart';
import 'package:tutoro/login.dart';
import 'package:http/http.dart' as http;
import 'about_us.dart';
import 'bookmark_colleges.dart';
import 'edit_profile.dart';


class myDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _myDrawe();
  }
}

class _myDrawe extends State<myDrawer>{
  var name;
  var email;
  var output;

  @override
  void initState() {
    super.initState();
    get_otp(context);
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        print("222");
      });
    });
  }

  get_otp(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name_user")!;
      email = prefs.getString("email_id")!;
      //output = getInitials(string: name, limitTo: 1);
    });
  }


  @override
  Widget build(BuildContext context) {
    output = getInitials(string: name, limitTo: 1);
    // TODO: implement build
    return Drawer(

      child: Container(
        // color: Color(int.parse("0xff${drawer_color}")),
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // SizedBox(
            //   height: 100,
            //   child:
              DrawerHeader(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(3),
                child:Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                     Center(
                       child: SizedBox(
                         width: 210,
                         height: 100,
                         child: Image.asset(
                            "assets/image/pic.png",
                            fit:BoxFit.cover,
                          ),
                       ),
                     ),
                      // Text("My Profile",style: TextStyle(
                      //   color: Colors.black,
                      //   fontWeight: FontWeight.bold,
                      //   fontSize: 16
                      // ),),
                    ],
                  ),
                )
              ),
           // ),

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
                        child: Text(output.toUpperCase(), style: TextStyle(color: Colors.white)),
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
                      child: Text("$name".toCapitalized(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("$email".toCapitalized(),
                        style: TextStyle(
                          fontSize: 13,
                        ),),
                    ),
                  ],
                ),

              ],
            ),

            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => home()));
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
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
            ),

            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => about_us()));
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
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
                    padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
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


            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => bookmark_list()));
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Container(
                        child: Icon(Icons.favorite,
                          size: 30,
                          color: Color(int.parse("0xff${colors_color.main_theme}"),),
                        ),
                      ),

                    ),
                  ),


                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Bookmark",
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
                  padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
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
                  padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
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
                  padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
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

            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => login()));
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
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
            ),

          ],
        ),
      ),
    );
  }

  String getInitials({required String string, required int limitTo}) {
    var buffer = StringBuffer();
    var split = string.split(' ');
    for (var i = 0 ; i < (limitTo ?? split.length); i ++) {
      buffer.write(split[i][0]);
    }

    return buffer.toString();
  }
}