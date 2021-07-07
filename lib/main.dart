import 'package:flutter/material.dart';
import 'todo.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'practice.dart';
import 'dart:async';
import 'dart:core';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'getX',
     home: HomePage(),
      getPages: [
        GetPage(name: '/next', page: () => NextPage()),
        GetPage(name: '/todo', page: () => ToDoList()),
        GetPage(name: '/practice', page:()=>GetPage()),

        //GetPage(name: '/snack', page: ()=> SnackBarPage()),
      ],
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Use GetX route'),
      ),

      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              children: <Widget>[
                 new RaisedButton(
                    child: Text('route1'),
                  onPressed: () {
                    Get.toNamed('/next');
                  },
                 shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
      ),
          new RaisedButton(
            child: Text('route2'),
            onPressed: () {
              Get.showSnackbar(
                GetBar(
                  title: 'Snackbar',
                  message: 'hello world',
                  duration: Duration(seconds: 2),
                  snackPosition: SnackPosition.BOTTOM,
                ),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
          ),
                new RaisedButton(
                  child: Text('route3'),
                  onPressed: () {
                    Get.defaultDialog(title: 'Dialog', middleText: 'Dialog');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),
                new RaisedButton(
                  child: Text('route4'),
                  onPressed: () {
                    Get.toNamed('/todo');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),

          ]
       ),
      ),
    );
  }
}


class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget>[
              Container(
                child: RaisedButton(
                  child: Text('Get.back()'),
                  onPressed:(){ Get.back();},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbar'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget>[
              Container(
                child: RaisedButton(
                  child: Text('Get.back()'),
                  onPressed:(){ Get.back();},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}



