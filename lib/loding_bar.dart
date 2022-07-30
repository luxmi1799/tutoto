 import 'dart:ui';

import 'package:flutter/material.dart';

loading(BuildContext context) async {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return new BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child:  AlertDialog(
            backgroundColor: Colors.transparent,
            content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width:70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black
                ),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              // Container(
              //     margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
            ]),
          )
      );
    },
  );
}

 extension StringCasingExtension on String {
   String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
   String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
 }