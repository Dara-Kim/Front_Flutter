import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 날짜 형식을 사용하기 위한 패키지

class Conversation extends StatefulWidget {
  const Conversation({super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> with TickerProviderStateMixin {

  late TabController diarytabController; // 탭 컨트롤러 선언

  @override
  void initState() {
    super.initState();
    diarytabController = TabController(length: 2, vsync: this); // initState에서 탭 컨트롤러 초기화
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(0xFF8DBFD2),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          backgroundColor: Colors.white,
          title: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(text: '일기장\nthống kê bố mẹ', style: TextStyle(color: Color(0xFF8DBFD2),),),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                //부모 일기 아이 일기 탭
                Container(
                  height: 60,
                  color: Colors.white,
                  child: TabBar(
                    controller: diarytabController,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        child: RichText(
                          textAlign: TextAlign.center, // 텍스트를 가운데 정렬
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '부모\n',
                                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'nhật ký của bố',
                                style: TextStyle(color: Colors.black, fontSize: 14,),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        child: RichText(
                          textAlign: TextAlign.center, // 텍스트를 가운데 정렬
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '아이\n',
                                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'nhật ký trẻ con',
                                style: TextStyle(color: Colors.black, fontSize: 14,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                //오늘 날짜
                Text(
                    DateFormat('yyyy년 MM월 dd일 EEEE').format(DateTime.now()),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:15,
                    )
                ),
                SizedBox(height: 10,),
                Container(
                    width: 300,
                    height: 400,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TabBarView(
                      controller: diarytabController,
                      children: <Widget>[
                        //부모 탭
                        SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20), // 20의 반지름을 가진 둥근 사각형 설정
                                  child: Image.network(
                                    'https://as1.ftcdn.net/v2/jpg/04/22/49/54/1000_F_422495424_AkP6hAHiYBhNxZ3kZUBuYouedhej37a3.jpg',
                                    width: 200, // 이미지의 너비
                                    height: 200, // 이미지의 높이
                                    fit: BoxFit.cover, // 이미지가 컨테이너에 맞게 잘리도록 설정
                                  ),
                                ),
                                // 작성된 일기 보여줄 자리


                              ),
                              SizedBox(height: 20), // 이미지와 아래 컨테이너 사이의 간격 조정
                              Container(
                                height: 500, // 스크롤 가능한 컨테이너의 높이
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
                                        child: Container(child: Center(child: Text('부모 일기 교정본 \n 부모 일기 번역본'),),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),



                        //아이탭
                        SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20), // 20의 반지름을 가진 둥근 사각형 설정
                                  child: Image.network(
                                    'https://as1.ftcdn.net/v2/jpg/04/22/49/54/1000_F_422495424_AkP6hAHiYBhNxZ3kZUBuYouedhej37a3.jpg',
                                    width: 200, // 이미지의 너비
                                    height: 200, // 이미지의 높이
                                    fit: BoxFit.cover, // 이미지가 컨테이너에 맞게 잘리도록 설정
                                  ),
                                ),
                              ),
                              SizedBox(height: 20), // 이미지와 아래 컨테이너 사이의 간격 조정

                              Container(
                                height: 500, // 스크롤 가능한 컨테이너의 높이
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
                                    Container(),
                                    
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/imageP.png',
                      width: 150,
                      height: 250,
                    ),
                    SizedBox(width: 50),
                    Image.asset(
                      'assets/imageC.png',
                      width: 150,
                      height: 250,
                    ),
                  ],
                )

              ],
            ),
          ),
        )
    );
  }
}
