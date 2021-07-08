import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/TodoScreen.dart';
import 'screens/HomeScreen.dart';


void main() async{
  await GetStorage.init();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home:HomeScreen(),
  ));
}