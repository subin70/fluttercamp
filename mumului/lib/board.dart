import 'package:flutter/material.dart';
import 'appBar.dart';
import 'package:get/get.dart';
import 'main.dart';

class QuestionBoardPage extends StatefulWidget {
  @override
  _QuestionBoardPageState createState() => _QuestionBoardPageState();
}

class _QuestionBoardPageState extends State<QuestionBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: 'Question'
      ),
      body: Container(
        child: TextButton(
          onPressed: (){

          },
          child: Text('board'),
        ),
      ),
    );
  }
}
