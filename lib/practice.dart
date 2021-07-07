import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class controller extends GetxController {
  var items = ''.obs;
  final textcontroller = TextEditingController();

  void createText(){
    items = textcontroller.text.obs;
    update();
  }

}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller c = Get.put(controller());

    return Scaffold(
      appBar: AppBar(
        title: Text("together"),
      ),
      body: Center(
        child:Column(
          children:[
            TextButton(onPressed: () {
              Get.to(Second());
            },
              child: Text('page'),),
            GetBuilder<controller> (
              init: controller(),
              builder: (_) => Text('${c.items}'),
            ),
          ],
        ),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.defaultDialog(
            title: 'data create',
            content: TextField(
              controller: c.textcontroller,
              //위에 이걸로 data를 넣는건가?
              decoration: InputDecoration(
                hintText: 'info',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  c.createText();
                  print("${c.items}");
                  Get.back();
                },
                child: Text('submit'),
              ),
            ],
          );
        },
      ),
    );
  }
}

class Second extends StatelessWidget {
  final controller c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("${c.items}")));
  }

}
