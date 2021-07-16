import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar customAppBar({String? title}){
  return AppBar(
    title: Text(title!),
    elevation: 0.0,
    backgroundColor: Colors.green,
    titleSpacing: 1.4,
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        Get.back();
      },
    ),
  );
}