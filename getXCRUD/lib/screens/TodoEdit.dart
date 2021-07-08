import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice1_crud/TodoController.dart';
import 'package:practice1_crud/models/Todo.dart';


class EditScreen extends StatelessWidget {

  final TodoController todoController = Get.find();
  late final int index;
  EditScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    String text = '';

    text = todoController.todos[index].text;
    List<bool> check = <bool>[];

    TextEditingController textEditingController = TextEditingController(text: text);
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
                      hintText: 'How ~ ~ :^ ) ',
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
                        var editing = todoController.todos[index];
                        editing.text = textEditingController.text;
                        todoController.todos[index] = editing;
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
