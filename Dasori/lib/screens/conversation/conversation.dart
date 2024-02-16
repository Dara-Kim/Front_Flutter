import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 날짜 형식을 사용하기 위한 패키지

class Conversation extends StatefulWidget {
  const Conversation({super.key});

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> with TickerProviderStateMixin {

  late TabController diaryTabController; // 탭 컨트롤러 선언

  //통신 URL: /home/conversation
  //통신: pid(variable.dart 내), date


  @override
  void initState() {
    super.initState();
    diaryTabController = TabController(length: 2, vsync: this);
    diaryTabController.addListener(_onTabChanged); // 탭 변경 이벤트 추가

  }

  // 탭 변경 이벤트
  void _onTabChanged() {
    setState(() {}); // 화면을 다시 그려줌
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBar(
              scrolledUnderElevation: 0,
              toolbarHeight: MediaQuery.of(context).size.height * 0.1,
              backgroundColor: Colors.white,
              title: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(text: '일기장\nthống kê bố mẹ', style: TextStyle(color: Color(0xFF8DBFD2),fontSize: 17),),
                ),
              ),
            ),

            //부모 일기 아이 일기 탭
            Container(
              color: Colors.white,
              child: TabBar(
                controller: diaryTabController,

                onTap: (index) {
                  setState(() {});
                },

                labelColor: Colors.black,
                unselectedLabelColor: Color(0xff8B8B8B),
                tabs: [
                  Tab(
                    child: Text(
                      '부모\nhật ký của bố',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      '아이\nnhật ký trẻ con',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(

              child: Container(
                color: Color(0xFF8DBFD2),
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                      //오늘 날짜
                      Text(
                          DateFormat('yyyy년 MM월 dd일 EEEE').format(DateTime.now()),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:15,
                          )
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01,),

                      //일기 보여줄 부분
                      Container(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                          width:  MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),


                          child: TabBarView(
                            controller: diaryTabController,
                            children: <Widget>[

                              //부모 탭 일기
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    //사진
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.02),
                                      width:  MediaQuery.of(context).size.width * 0.5,
                                      height:  MediaQuery.of(context).size.width * 0.5,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          'https://as1.ftcdn.net/v2/jpg/04/22/49/54/1000_F_422495424_AkP6hAHiYBhNxZ3kZUBuYouedhej37a3.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:  MediaQuery.of(context).size.height * 0.02,),
                                    Container(

                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_drop_down,
                                                color: Color(0xFF8DBFD2),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                '변경된 일기',
                                                style: TextStyle(fontSize: 16,color: Color(0xFF8DBFD2)),
                                              ),
                                            ],
                                          ),
                                          Center(
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Color(0xFF8DBFD2),),
                                                  borderRadius:BorderRadius.circular(20)
                                              ),
                                              child: Container(child: Center(child: Text('부모 일기 교정본 \n 부모 일기 번역본\n'),),),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_drop_down,
                                                color: Color(0xFF8DBFD2),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                '작성한 일기',
                                                style: TextStyle(fontSize: 16,color: Color(0xFF8DBFD2)),
                                              ),
                                            ],
                                          ),
                                          Center(
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Color(0xFF8DBFD2),),
                                                  borderRadius:BorderRadius.circular(20)
                                              ),
                                              child: Container(child: Center(child: Text('부모 일기 원본'),),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //아이 탭 일기
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.02),
                                      width:  MediaQuery.of(context).size.width * 0.5,
                                      height:  MediaQuery.of(context).size.width * 0.5,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          'https://as1.ftcdn.net/v2/jpg/04/22/49/54/1000_F_422495424_AkP6hAHiYBhNxZ3kZUBuYouedhej37a3.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20), // 이미지와 아래 컨테이너 사이의 간격 조정

                                    Container(// 스크롤 가능한 컨테이너의 높이
                                      child: Column(
                                        children: [
                                          // 교정본, 번역본
                                          Container(),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_drop_down,
                                                color: Color(0xFF8DBFD2),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                '작성한 일기',
                                                style: TextStyle(fontSize: 16,color: Color(0xFF8DBFD2)),
                                              ),
                                            ],
                                          ),
                                          Center(
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Color(0xFF8DBFD2),),
                                                  borderRadius:BorderRadius.circular(20)
                                              ),
                                              child: Container(child: Center(child: Text('부모 일기 교정본 \n 부모 일기 번역본'),),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                      ),

                      // 생성된 캐릭터
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              _showImagePopupParent(context);
                            },
                            child: Image.asset(
                              'assets/imageP.png',
                              width: 150,
                              height: 250,
                            ),
                          ),

                          SizedBox(width: 50),

                          InkWell(
                            onTap: () {
                              _showImagePopupChild(context);
                            },
                            child: Image.asset(
                              'assets/imageC.png',
                              width: 150,
                              height: 250,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}

void _showImagePopupParent(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      //수정: 캐릭터 위치에 맞춰서 말풍선 위치 설정되도록 변경해보기
      return AlertDialog(
        backgroundColor: Colors.transparent,
        content: Stack(
          children: [
            Image.asset(
              'assets/conv_parent_question.png',
            ),
            Positioned.fill(
                child: Center(
                  child: Text('어떤 요리를 가장 좋아해?',
                    style: TextStyle(fontSize: 20),
                  ),
                )
            )
          ],
        ),
      );
    },
  );
}

void _showImagePopupChild(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        content: Stack(
          children: [
            Image.asset(
              'assets/conv_child_question.png',
            ),
            Positioned.fill(
                child: Center(
                  child: Text('뭘 만들었는지 말해줘!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                )
            )
          ],
        ),
      );
    },
  );
}