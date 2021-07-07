import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Books.dart';
import 'controller.dart';


void main() => runApp(GetMaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {

  final Controller c = Get.put(Controller());
  TextEditingController titleEdit = TextEditingController();
  TextEditingController authorEdit = TextEditingController();

  //List<ListTile> tiles = [];
  final int index=0;
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    String text = '';

    return Scaffold(
      appBar: AppBar(
        title: Text("together"),
      ),
      body: Center(
        child:Column(
         children:[
           Obx(()=>ListView.separated(
             shrinkWrap: true,
               itemBuilder: (context, index) => ListTile(
                 title : Row(
                   children:[
                     Column(
                       children: [
                         Text(c.books[index].title),
                         Text(c.books[index].author),
                       ],
                     ),
                  ]
              ),),
               separatorBuilder: (_, __) =>Divider(),
               itemCount: c.books.length

           ),
        )

        /*
           GetBuilder<controller> (
              init: controller(),
              builder: (_) => ListView(children: tiles),
                  //Text('Title : ${c.title}, Author :${c.author}'),
            ),*/
      ],
        ),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.defaultDialog(
            title: 'data create',
            content: Column(
              children: [
                TextField(
                  controller: titleEdit,
                  //위에 이걸로 data를 넣는건가?
                  decoration: InputDecoration(
                    hintText: 'title',
                  ),
                ),
                TextField(
                  controller: authorEdit,
                  //위에 이걸로 data를 넣는건가?
                  decoration: InputDecoration(
                    hintText: 'author',
                  ),
                ),

              ],

            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('cancel'),
              ),
              TextButton(
                onPressed: () {
                  c.books
                      .add(Book(title: titleEdit.text, author: authorEdit.text)
                  );
                  Get.back();
                },
                child: Text('add'),
              ),
            ],
          );
        },
      ),
    );
  }
}

/*
class Second extends StatelessWidget {
  final controller c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("${c.title}, ${c.author}")));
  }

}*/
