import 'package:flutter/material.dart';
import 'package:Front_Flutter/screens/home/home.dart';
import 'package:Front_Flutter/screens/conversation/conversation_today.dart';
import 'package:Front_Flutter/screens/diary/parent_diary_upload.dart';
import 'package:Front_Flutter/screens/diary/child_diary_camera.dart';


class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          // extendBody: true,
          body: TabBarView(
            children: <Widget>[
              Home(),
              Conversation(),
              // Container(child: Center(child: Text('report'),),),
              // Container(child: Center(child: Text('setting'),),)
              Upload(),
              Camera()
            ],
          ),

          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    actionsPadding: EdgeInsets.all(16.0),
                    actionsAlignment: MainAxisAlignment.center,
                    actions: <Widget>[
                      TextButton(

                        style: TextButton.styleFrom(backgroundColor: Color(0xFF8DBFD2)),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(text: '부모 일기 작성\nViết nhật ký', style: TextStyle(color: Colors.white,fontSize: 16),),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            // MaterialPageRoute(builder: (context) => Upload()),
                            MaterialPageRoute(builder: (context) => Upload()),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Image.asset('assets/dasol.png',
              width: MediaQuery.of(context).size.height * 0.08,
              height: MediaQuery.of(context).size.height * 0.08,
             ),
            backgroundColor: Colors.transparent,
            shape: CircleBorder(),
          ),

          bottomNavigationBar: _buildBottomAppBar(),
        ),
      ),
    );
  }

  BottomAppBar _buildBottomAppBar() {
    //리포트에서만 bottomNavBar 스타일 변경
    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      notchMargin: 5,
      child: TabBar(
        labelColor: Color(0xFF1F637D),
        unselectedLabelColor: Color(0xFF8DBFD2),
        indicatorColor: Colors.transparent,

        tabs: [
          Tab(icon: Icon(Icons.home),),
          Container(
            margin: EdgeInsets.only(right: 30.0), // 두 번째 Tab의 양쪽에 간격을 추가
            child: Tab(
              icon: Icon(Icons.menu_book),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.0), // 세 번째 Tab의 왼쪽에만 간격을 추가
            child: Tab(
              icon: Icon(Icons.bar_chart),
            ),
          ),
          Tab(icon: Icon(Icons.settings),),
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.08,
    );
  }
}