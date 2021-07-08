import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'models/Todo.dart';
import 'package:flutter/material.dart';

class TodoController extends GetxController{
  //late List<Todo> todos; //미래에 쓸것이다
  var todos = <Todo>[].obs;

  @override
  void onInit() {
    List? storedTodos = GetStorage().read<List>('todos');
    if(!storedTodos.isNull) {
      todos = storedTodos!
          .map((e) => Todo.fromJson(e))
          .toList()
          .obs;
    }
    ever(todos, (_){
      GetStorage().write('todos', todos.toList());
    });
    super.onInit();
  }
}