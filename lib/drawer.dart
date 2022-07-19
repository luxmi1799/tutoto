import 'package:flutter/material.dart';
import 'package:tutoro/colors/colors.dart';
import 'package:tutoro/login.dart';

import 'about_us.dart';
import 'edit_profile.dart';

class myDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
                            "assets/image/tutorologo.png",
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
}