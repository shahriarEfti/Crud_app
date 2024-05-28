import 'dart:ui';

import 'package:crud_rest_api_assignment/Screens/ProductGridViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const colorRed=Color.fromRGBO(231, 28, 36, 1);
const colorGreen=Color.fromRGBO(33, 191, 110, 1);
const colorwhite=Color.fromRGBO(255, 255, 255, 1);
const colorDarkblue=Color.fromRGBO(44, 62, 80, 1);




void Errortoats(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorRed,
      textColor:colorwhite,
      fontSize: 16.0
  );

}

void Successtoats(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorGreen,
      textColor:colorwhite,
      fontSize: 16.0
  );

}

InputDecoration AppInputDecoration(label){

return InputDecoration(
  focusedBorder:   OutlineInputBorder(
    borderSide: BorderSide(color: colorGreen,width: 2)
  ),
  fillColor: colorwhite,
  filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
  enabledBorder:  OutlineInputBorder(
      borderSide: BorderSide(color: colorwhite,width: 0)
  ),
  border: OutlineInputBorder(),
  labelText: label,

);

}

SliverGridDelegateWithFixedCrossAxisCount ProductGridViewStyle(){
  return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount:2,
  mainAxisSpacing: 2,
  mainAxisExtent: 250);

}

