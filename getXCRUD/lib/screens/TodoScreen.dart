import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice1_crud/TodoController.dart';
import 'package:practice1_crud/models/Todo.dart';


class TodoScreen extends StatelessWidget {

  final TodoController todoController = Get.find();
  late final int index;
  TodoScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    String text = ' ';
    text = todoController.todos[index].text;

   TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(36.0),
        child: Column(
          children: [
            Expanded(
              child:
                TextField(
                  autofocus: true,
                  //마우스 커서
                  controller: textEditingController,
                  decoration: InputDecoration(
                      hintText: 'How ~ ~ : ^) ',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  style: TextStyle(
                    fontSize: 26.5,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 50,
               ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: Text('Cancel'),
                    onPressed:(){
                      Get.back();
                    }
                    ),
                  ElevatedButton(
                     // child: Text(check.length > this.index) ? 'Add' : 'Edit'),
                  child: Text('add'),
                  onPressed:(){
                     todoController.todos
                         .add(Todo(text: textEditingController.text));
                    // Get.back();
                    /*
                    if (this.index <0 ) {
                      todoController.todos
                          .add(Todo(text: textEditingController.text));
                    } else {
                    var editing = todoController.todos[index];
                    editing.text = textEditingController.text;
                    todoController.todos[index] = editing;
                    }*/
                    Get.back();
                  }
                  ),
                ],
              ),

          ],
        ),
      )
    );
  }
}
