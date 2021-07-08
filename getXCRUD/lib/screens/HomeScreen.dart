import 'package:flutter/material.dart';
import 'package:practice1_crud/TodoController.dart';
import 'package:get/get.dart';
import 'package:practice1_crud/screens/TodoEdit.dart';
import 'package:practice1_crud/screens/TodoScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());

    return Scaffold(
      appBar: AppBar(
        title: Text('GetX todo list'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Get.to(TodoScreen(index: 2));
        },
      ),
      body: Container(
        child: Obx(
            ()=>ListView.separated(
                itemBuilder: (context, index) => Dismissible(
                  key: UniqueKey(),
                  onDismissed:(_){
                    var removed = todoController.todos[index];
                    todoController.todos.removeAt(index);
                    Get.snackbar('Task removed', "removed",
                    mainButton: TextButton(
                      child: Text('undo'),
                      onPressed:(){
                        if(removed.isNull){
                          return;
                        }
                        todoController.todos.insert(index, removed);
                        //removed = null;
                        if(Get.isSnackbarOpen!){
                          Get.back();
                        }
                      },
                    ));
                  },
                child: ListTile(
                  title: Text(todoController.todos[index].text,
                  style:(todoController.todos[index].done)
                      ?TextStyle()
                      :TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color),),
                  onTap: (){
                    Get.to(EditScreen(index: index));
                  },
                  leading: Checkbox(
                    value: todoController.todos[index].done,
                    onChanged: (v){
                      var changed = todoController.todos[index];
                      changed.done = v!;
                      todoController.todos[index] = changed;
                    },
                  ),
                  //trailing
                ),),
                separatorBuilder: (_, __) => Divider(),
                itemCount: todoController.todos.length)
        )
      ),
    );
  }
}
