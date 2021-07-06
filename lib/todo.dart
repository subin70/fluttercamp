import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';

//import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'dart:core';

class Todo{
  bool isDone = false;
  String title;

  Todo(this.title,{this.isDone = false});
}

class ToDoList extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ToDoList> {
  //상단에 문자열 컨트롤러 생성
  //final _item = <Todo>[];

  var toDoController = TextEditingController();
  @override
  void dispose(){
    toDoController.dispose(); //사용이 끝나면 해제
    super.dispose();
  }
  void _addTodo(Todo todo){
    //FirebaseFirestore.instance
    //    .collection('todo').add({'title' : todo.title, 'isDone':todo.isDone});
   // toDoController.text = '';
    /*
    setState(() {
      _item.add(todo);
      toDoController.text ='';
    });*/
  }
  void _deleteTodo(DocumentSnapshot doc){
    // FirebaseFirestore.instance.collection('todo').docs(doc.id).delete();
    /* setState(() {
      _item.remove(todo);
    }*/
    // );
  }
  void _toggleTodo(DocumentSnapshot doc){
    FirebaseFirestore.instance
        .collection('todo').doc(doc.id).update({
      'isDone' : doc['isDone'],
    });
    /*
    setState(() {
      todo.isDone = !todo.isDone; //true 값 반전
    });*/
  }

  Widget _buildItem(DocumentSnapshot doc){ //todo 객체를 list로 변환
    final todo = Todo(doc['title'], isDone:doc['isDone']);

    return ListTile(
      onTap: () => _toggleTodo(doc),
      // 기능?
      title: Text(
        todo.title,
        style: todo.isDone
            ? TextStyle(
          decoration: TextDecoration.lineThrough,
          fontStyle: FontStyle.italic, //눕는 글씨
        ):null,
      ),
      trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => _deleteTodo(doc) //DB 연결
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TO DO LIST'),
        backgroundColor: Colors.amber,
        centerTitle:true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child:
                TextField(
                  controller: toDoController,
                ),
                ),
                ElevatedButton(
                  onPressed: () => _addTodo(Todo(toDoController.text)),
                  child: Text('add todo'),

                )
              ],
            ),
            /*매번 값이 변할때마다  화면 전체가 아닌 일부분 그림
              snapshots으로 데이터의 스트림을 쉽게 얻을 수 있음
              * */
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('todo').snapshots(), //collection->stream
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                final documents = snapshot.data!.docs; //데이터 얻기
                return Expanded(
                  child: ListView(
                    //_item 대신에
                    children: documents.map((doc) => _buildItem(doc)).toList(),
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}