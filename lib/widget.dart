import 'package:flutter/material.dart';

Widget blueButton({BuildContext? context, String? label, double? buttonWidth}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 18),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(30),
    ),
    alignment: Alignment.center,
    width:buttonWidth!=null ? buttonWidth : MediaQuery.of(context!).size.width - 48,
    child: Text(label ?? '', style: TextStyle(color: Colors.white, fontSize: 16),),
  );
}

