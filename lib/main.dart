import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tutoro/home.dart';

import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
          brightness: Brightness.dark
      ),
      // initialRoute: "/login",
      // routes: {
      // "/" :(context) => login(),
      // }
         home: SplashScreen(
            seconds: 4,
            navigateAfterSeconds: new login(),
            title: new Text('',
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              ),),
            image: new Image.asset("assets/image/tutorologo.png"),
            backgroundColor: Colors.white,
            styleTextUnderTheLoader: new TextStyle(),
            photoSize: 100.0,
        )
    );
  }

}
