import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Books.dart';

class Controller extends GetxController {
  var books = <Book>[].obs;
/*
  var title = ''.obs;
  var author = ''.obs;

  final titlecontroller = TextEditingController();
  final authorcontroller = TextEditingController();

  void createText(){
    title = titlecontroller.text.obs;
    author = authorcontroller.text.obs;
    update();
  }*/
}