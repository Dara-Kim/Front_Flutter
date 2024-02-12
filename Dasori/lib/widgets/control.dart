import 'package:flutter/material.dart';
import 'package:Front_Flutter/screens/home/home.dart';
import 'package:Front_Flutter/screens/conversation/conversation.dart';

class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {

  int _selectedIndex = 1; //현재 선택된 탭의 인덱스 저장

  late TabController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: <Widget> [
              Home(),
              Conversation(),
              Container(child: Center(child: Text('report'),),),
              Container(child: Center(child: Text('setting'),),)
            ],
          ),

          floatingActionButton: FloatingActionButton(onPressed: () {},
            child: Image.asset(
              'assets/dasol.png', // 원하는 이미지 파일의 경로
              width: 50.0, // 이미지의 너비
              height: 50.0, // 이미지의 높이
              fit: BoxFit.cover, // 이미지가 버튼에 맞게 잘리도록 설정
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          bottomNavigationBar: _buildBottomAppBar(_selectedIndex),
        ),
      ),
    );
  }

  BottomAppBar _buildBottomAppBar(int _selectedIndex) {
    //리포트에서만 bottomNavBar 스타일 변경
    if (_selectedIndex ==2) {
      return BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: TabBar(
          labelColor: Color(0x1F637D),
          unselectedLabelColor:Color(0xFF8DBFD2),
          indicatorColor: Colors.transparent, // 밑줄 색상을 투명으로 설정
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
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
        height: 50,
      );
    } else {
      return BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: TabBar(
          unselectedLabelColor:Colors.white,
          indicatorColor: Colors.transparent, // 밑줄 색상을 투명으로 설정하여 보이지 않게 함
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
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
        height: 50,
      );
    }
  }
}



