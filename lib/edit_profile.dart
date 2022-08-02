import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutoro/colors/colors.dart';
import 'package:tutoro/loding_bar.dart';


File? imageFile;
TextEditingController _address = TextEditingController();
TextEditingController _pincode = TextEditingController();

class edit_profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _edit_profile();
  }
}

class _edit_profile extends State<edit_profile> {

  var name;
  var email;
  var mobile;
  var user_id;
  TextEditingController _fullname = TextEditingController();

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
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return new BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child:  AlertDialog(
              content: Row(children: [
                CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
                Container(margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
              ]),
            )
        );
      },
    );
    setState(() {
      name = prefs.getString("name_user")!;
      _fullname.text = name;
      email = prefs.getString("email_id")!;
      mobile = prefs.getString("Mobile")!;
      user_id = prefs.getString("user_id")!;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       appBar: PreferredSize(
         preferredSize: Size.fromHeight(50.0), // here the desired height
         child: AppBar(
           title: Text("Edit Profile",style: TextStyle(
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
           children: [
             Padding(
               padding: const EdgeInsets.only(top: 30,bottom: 20),
               child: Center(
                 child:  Stack(
                   alignment: Alignment.center,
                   children:[
                   //  Image.asset("assets/image/profilebg.png"),

                     InkWell(
                       onTap: _getFromGallery,
                       child: CircleAvatar(
                           backgroundColor: Colors.black,
                           radius: 60.0,
                           child:CircleAvatar(
                               backgroundImage: imageFile!= null ? Image.file(imageFile!).image :Image.asset('assets/image/editp.png',color: Color(0xffECAE0F),fit: BoxFit.cover,).image,radius:60)
                         // child: CircleAvatar(
                         //   radius: 55.0,
                         //   backgroundImage: imageFile!=null?AssetImage('assets/image/profile.png'):FileImage(imageFile!),
                         //   child: ClipOval(
                         //     child: (imageFile != null)
                         //         ? Image.file(imageFile!)
                         //         : Image.asset('assets/image/profile.png'),
                         //   ),
                         //   backgroundColor: Colors.white,
                         // ),
                       ),
                     ),
                     Positioned(
                       bottom: 5,
                       right: 10,
                       child: Container(
                         width: 34,
                         height: 40,
                         decoration: ShapeDecoration(
                           shape: CircleBorder(),
                           color: Color(0xffECAE0F),
                         ),
                         child: IconButton(
                           onPressed: () {
                             _getFromGallery();
                           },
                           icon: Icon(
                             Icons.edit,
                             color: Colors.white,
                             size: 20,
                           ),
                         ),
                       ),
                     ),
                     // Positioned(
                     //   child: InkWell(
                     //     onTap: _getFromGallery,
                     //     child: CircleAvatar(
                     //       backgroundColor: Colors.black,
                     //       radius: 55.0,
                     //       child:CircleAvatar(
                     //           backgroundImage: imageFile!= null ? Image.file(imageFile!).image :Image.asset('assets/image/editp.png',color: Color(0xffECAE0F),fit: BoxFit.cover,).image,radius:55)
                     //       // child: CircleAvatar(
                     //       //   radius: 55.0,
                     //       //   backgroundImage: imageFile!=null?AssetImage('assets/image/profile.png'):FileImage(imageFile!),
                     //       //   child: ClipOval(
                     //       //     child: (imageFile != null)
                     //       //         ? Image.file(imageFile!)
                     //       //         : Image.asset('assets/image/profile.png'),
                     //       //   ),
                     //       //   backgroundColor: Colors.white,
                     //       // ),
                     //     ),
                     //   ),
                     // ),
                   ]
                 ),
               ),
             ),


             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 12),
               child: TextFormField(
                 controller: _fullname,
                 style: TextStyle(color: Colors.black),
                 decoration: InputDecoration(
                   hintText: "Full name",
                   hintStyle: TextStyle(
                     color: Colors.grey,
                     fontSize: 13,
                   ),
                  // labelText: "$name".toCapitalized(),
                   labelStyle: TextStyle(
                     //fontWeight: FontWeight.bold,
                     fontSize:18,
                     color: Colors.black
                   ),
                   //prefixIcon: new Icon(Icons.lock),
                 ),
               ),
             ),

             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 12),
               child: TextFormField(
                 enabled: false,
                 style: TextStyle(color: Colors.black),
                 decoration: InputDecoration(
                   hintText: "Email Id",
                   hintStyle: TextStyle(
                     color: Colors.grey,
                     fontSize: 13,
                   ),
                   labelText: "$email".toCapitalized(),
                   labelStyle: TextStyle(
                     //fontWeight: FontWeight.bold,
                     fontSize:18,
                     color: Colors.black,
                   ),
                   //prefixIcon: new Icon(Icons.lock),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 12),
               child: IntlPhoneField(
                 enabled: false,
                 style: TextStyle(color: Colors.black),
                 initialCountryCode: 'IN',
                 decoration: InputDecoration(
                   labelText: '$mobile',
                   labelStyle: TextStyle(
                     //fontWeight: FontWeight.bold,
                     fontSize:18,
                     color: Colors.black,
                   ),
                   border: UnderlineInputBorder(
                     borderSide: BorderSide(),
                   ),
                 ),
                 onChanged: (phone) {
                   print(phone.completeNumber);
                 },
                 onCountryChanged: (country) {
                   print('Country changed to: ' + country.name);
                 },
               ),
             ),


             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 12),
               child: TextFormField(
                 controller: _pincode,
                 keyboardType: TextInputType.number,
                 style: TextStyle(color: Colors.black),
                 decoration: InputDecoration(
                   hintText: "Pincode",
                   hintStyle: TextStyle(
                     color: Colors.grey,
                     fontSize: 13,
                   ),
                   //labelText: "Batch Id",
                   labelStyle: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize:20,
                   ),
                   //prefixIcon: new Icon(Icons.lock),
                 ),
               ),
             ),

             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 12),
               child: TextFormField(
                 controller: _address,
                 style: TextStyle(color: Colors.black),
                 decoration: InputDecoration(
                   hintText: "Address",
                   hintStyle: TextStyle(
                     color: Colors.grey,
                     fontSize: 13,
                   ),
                   //labelText: "Batch Id",
                   labelStyle: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize:20,
                   ),
                   //prefixIcon: new Icon(Icons.lock),
                 ),
               ),
             ),

             Padding(
               padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 60),
               child: Center(
                 child: InkWell(
                   onTap: (){
                     edit_profile(name,_address.text, _pincode.text, user_id,imageFile!.path);
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
                       borderRadius: BorderRadius.circular(4),
                     ),
                   ),
                 ),
               ),
             ),
           ],
         ),
       ),
     );
  }
  void edit_p(String name,String address,String pincode ,String user_id) async {
    String postUrl = "https://tutoro.co.in/mobile-authenticate/update-member.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['Name'] = name;
    request.fields['Address'] = address;
    request.fields['Pincode'] = pincode;
    request.fields['UserId'] = user_id;

    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          print("onValue${onValue.body}");
          Map mapRes = json.decode(onValue.body);
          var success= mapRes["commandResult"]["success"];
          setState(() {
          });
        } catch (e) {
          print("response$e");
        }
      });
    });
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      // maxWidth: 1800,
      // maxHeight: 1800,
    );
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      }
    });
  }

  void edit_profile(String name,String address,String pincode ,String user_id,String imagepath) async {
    String postUrl = "https://tutoro.co.in/mobile-authenticate/update-member.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['Name'] = name;
    request.fields['Address'] = address;
    request.fields['Pincode'] = pincode;
    request.fields['UserId'] = user_id;
    request.fields['profile_pic'] = imagepath;

    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          print("onValue${onValue.body}");
          Map mapRes = json.decode(onValue.body);
          var success= mapRes["commandResult"]["success"];
          var msg = mapRes["commandResult"]["message"];
          if(success == 1){
            Fluttertoast.showToast(
                msg: msg,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1
            );
          }
          else {
            Fluttertoast.showToast(
                msg: msg,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1
            );
          }
        } catch (e) {
          print("response$e");
        }
      });
    });
  }

}