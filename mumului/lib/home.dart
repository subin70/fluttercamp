import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mumului/board.dart';
import 'appBar.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:get/get.dart';
import 'mypage.dart';
import 'main.dart';

import 'dashboard_controller.dart';

/*
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
*/
//class _HomePageState extends State<HomePage> {
class HomePage extends GetView<DashboardController>{
  @override
  Widget build(BuildContext context) {
    //return GetBuilder<DashboardController>(
    //    builder: (controller) {
          return Scaffold(
            backgroundColor: Color(0xffe5ddca),
             appBar: customAppBar(
               title: '무물'
             ),
              body: Column(
                children: [/*
                  SafeArea(
                          child: IndexedStack(
                            //index: controller.tabIndex,
                            children: [
                              HomePage(),
                              QuestionBoardPage(),
                              MyPage(),
                          ]
                          ),
                  ),*/
                  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            SizedBox(
                              height: 300.0,
                            ),
                            Container(
                              height: 183.0, width:360,

                              decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30)

                                )
                              ),
                              child: Column(
                                  children: <Widget> [
                                    SizedBox(height: 30,),
                                    Text('나의 식물 '),
                                    Text('무럭 무럭자라고있어요'),
                                    SizedBox(height: 30,),
                                   ElevatedButton(
                                      onPressed: (){
                                    },
                                    child: Text('도움 요청하기'))
                                    ]
                               ),)
                          ]
                    )
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.teal,

                elevation: 0.0,
                items: [
                  _bottomNavigationBarItem(
                      icon: CupertinoIcons.home,
                      label: 'Home',
                      ),
                  _bottomNavigationBarItem(
                  icon: CupertinoIcons.archivebox,
                  label: 'board',
                  ),
                  _bottomNavigationBarItem(
                  icon: CupertinoIcons.person,
                  label: 'Account',
                  ),
                    ],
              ),
          );
        }
   //  );
 // }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
