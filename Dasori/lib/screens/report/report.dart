import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 날짜 형식을 사용하기 위한 패키지
import 'dart:math';

// 전달 받을 데이터 : 부모 한국어 사용 비율 30일치, 부모 한국어 교정 비율

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> with TickerProviderStateMixin {

  late TabController reportTabController; // 탭 컨트롤러 선언

  @override
  void initState() {
    super.initState();
    reportTabController = TabController(length: 2, vsync: this);
    reportTabController.addListener(_onTabChanged); // 탭 변경 이벤트
  }

  void _onTabChanged() {
    setState(() {}); // 화면을 다시 그려줌
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
          children: [
            AppBar(
              scrolledUnderElevation: 0,
              toolbarHeight: MediaQuery.of(context).size.height * 0.1,
              backgroundColor: Color(0xFF8DBFD2),
              title: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(text: '일기 통계\nthống kê bố mẹ', style: TextStyle(color: Colors.white,fontSize: 17),),
                ),
              ),
            ),

            //부모 일기 아이 일기 탭
            Container(
              color: Color(0xFF8DBFD2),
              child: TabBar(
                controller: reportTabController,

                onTap: (index) {
                  setState(() {});
                },

                labelColor: Colors.white,
                unselectedLabelColor: Color(0xff8B8B8B),
                tabs: [
                  Tab(
                    child: Text(
                      '부모\nnhật ký của bố',
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
              child: TabBarView(
                controller: reportTabController,
                children: <Widget>[

                  //부모탭 리포트 결과
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

                          //TODAY
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                              Container( height:1.0,
                                width:MediaQuery.of(context).size.width * 0.25,
                                color:Color(0xff6B6B6B),),
                              Text(
                                'TODAY',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff6B6B6B),
                                ),
                              ),
                              Container( height:1.0,
                                width:MediaQuery.of(context).size.width * 0.25,
                                color:Color(0xff6B6B6B),),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                          Text(
                              DateFormat('yyyy년 MM월 dd일 EEEE').format(DateTime.now()),
                              style: TextStyle(
                                color: Color(0xff6B6B6B),
                                fontSize:15,
                              )
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Color(0xFF8DBFD2),),
                                        borderRadius:BorderRadius.circular(20)
                                    ),
                                  ),
                                  Text(
                                      '한국어 사용 비율',
                                      style: TextStyle(
                                        color: Color(0xff6B6B6B),
                                        fontSize:15,
                                      )
                                  ),
                                  //추후 비율 변수 값 대입(일별 한국어 사용 비울)
                                  Text('50%',
                                    style: TextStyle(
                                    color: Colors.blue,
                                    fontSize:20,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Color(0xFF8DBFD2),),
                                        borderRadius:BorderRadius.circular(20)
                                    ),
                                  ),
                                  Text(
                                      '한국어 교정 비율',
                                      style: TextStyle(
                                        color: Color(0xff6B6B6B),
                                        fontSize:15,
                                      )
                                  ),
                                  //추후 비율 변수 값 대입(일별 한국어 사용 비울)
                                  Text('75%',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize:20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.06,),

                          //최근 일기 7개
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                              Container( height:1.0,
                                width:MediaQuery.of(context).size.width * 0.2,
                                color:Color(0xff6B6B6B),),
                              Text(
                                '최근 일기 7개',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff6B6B6B),
                                ),
                              ),
                              Container( height:1.0,
                                width:MediaQuery.of(context).size.width * 0.2,
                                color:Color(0xff6B6B6B),),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                          Text(
                                '한국어 사용 비율',
                                style: TextStyle(
                                color: Color(0xff6B6B6B),
                                fontSize:15,
                              )
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF8DBFD2),),
                                borderRadius:BorderRadius.circular(20)
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                          Text(
                              '한국어 교정 비율',
                              style: TextStyle(
                                color: Color(0xff6B6B6B),
                                fontSize:15,
                              )
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF8DBFD2),),
                                borderRadius:BorderRadius.circular(20)
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

                          //최근 일기 30개
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                              Container( height:1.0,
                                width:MediaQuery.of(context).size.width * 0.2,
                                color:Color(0xff6B6B6B),),
                              Text(
                                '최근 일기 30개',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff6B6B6B),
                                ),
                              ),
                              Container( height:1.0,
                                width:MediaQuery.of(context).size.width * 0.2,
                                color:Color(0xff6B6B6B),),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: MediaQuery.of(context).size.width * 0.6,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xFF8DBFD2),),
                                    borderRadius:BorderRadius.circular(20)
                                ),
                              ),
                              Positioned(
                                left: MediaQuery.of(context).size.width * 0.03,
                                top: MediaQuery.of(context).size.height * 0.01,
                                child: Text(
                                    '일별 한국어 사용 비율',
                                    style: TextStyle(
                                      color: Color(0xff6B6B6B),
                                      fontSize:15,
                                    )
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: MediaQuery.of(context).size.width * 0.6,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xFF8DBFD2),),
                                    borderRadius:BorderRadius.circular(20)
                                ),
                              ),
                              Positioned(
                                left: MediaQuery.of(context).size.width * 0.03,
                                top: MediaQuery.of(context).size.height * 0.01,
                                child: Text(
                                    '일별 한국어 교정 비율',
                                    style: TextStyle(
                                      color: Color(0xff6B6B6B),
                                      fontSize:15,
                                    )
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                        ],
                      ),
                    ),
                  ),

                  //아이탭 리포트 결과
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

                          //TODAY
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                              Container( height:1.0,
                                width:MediaQuery.of(context).size.width * 0.25,
                                color:Color(0xff6B6B6B),),
                              Text(
                                'TODAY',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff6B6B6B),
                                ),
                              ),
                              Container( height:1.0,
                                width:MediaQuery.of(context).size.width * 0.25,
                                color:Color(0xff6B6B6B),),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                          Text(
                              DateFormat('yyyy년 MM월 dd일 EEEE').format(DateTime.now()),
                              style: TextStyle(
                                color: Color(0xff6B6B6B),
                                fontSize:15,
                              )
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Color(0xFF8DBFD2),),
                                        borderRadius:BorderRadius.circular(20)
                                    ),
                                  ),
                                  Text(
                                      '아이의 오늘 기분',
                                      style: TextStyle(
                                        color: Color(0xff6B6B6B),
                                        fontSize:15,
                                      )
                                  ),
                                  //추후 비율 변수 값 대입(일별 한국어 사용 비울)
                                  Text('50%',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize:20,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Color(0xFF8DBFD2),),
                                        borderRadius:BorderRadius.circular(20)
                                    ),
                                  ),
                                  Text(
                                      '교정 비율',
                                      style: TextStyle(
                                        color: Color(0xff6B6B6B),
                                        fontSize:15,
                                      )
                                  ),
                                  //추후 비율 변수 값 대입(일별 한국어 사용 비울)
                                  Text('75%',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize:20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.06,),

                          //최근 일기 7개
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                              Container( height:1.0,
                                width:MediaQuery.of(context).size.width * 0.2,
                                color:Color(0xff6B6B6B),),
                              Text(
                                '최근 일기 7개',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff6B6B6B),
                                ),
                              ),
                              Container( height:1.0,
                                width:MediaQuery.of(context).size.width * 0.2,
                                color:Color(0xff6B6B6B),),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                          Text(
                              '감정 기록',
                              style: TextStyle(
                                color: Color(0xff6B6B6B),
                                fontSize:15,
                              )
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF8DBFD2),),
                                borderRadius:BorderRadius.circular(20)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  'assets/dasol.png',
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  height: MediaQuery.of(context).size.width * 0.1,
                                ),
                                Image.asset(
                                  'assets/dasol.png',
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  height: MediaQuery.of(context).size.width * 0.1,
                                ),
                                Image.asset(
                                  'assets/dasol.png',
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  height: MediaQuery.of(context).size.width * 0.1,
                                ),
                                Image.asset(
                                  'assets/dasol.png',
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  height: MediaQuery.of(context).size.width * 0.1,
                                ),
                                Image.asset(
                                  'assets/dasol.png',
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  height: MediaQuery.of(context).size.width * 0.1,
                                ),
                                Image.asset(
                                  'assets/dasol.png',
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  height: MediaQuery.of(context).size.width * 0.1,
                                ),
                                Image.asset(
                                  'assets/dasol.png',
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  height: MediaQuery.of(context).size.width * 0.1,
                                ),




                              ],
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                          Text(
                              '한국어 교정 비율',
                              style: TextStyle(
                                color: Color(0xff6B6B6B),
                                fontSize:15,
                              )
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF8DBFD2),),
                                borderRadius:BorderRadius.circular(20)
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

                          //최근 일기 30개
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                              Container( height:1.0,
                                width:MediaQuery.of(context).size.width * 0.2,
                                color:Color(0xff6B6B6B),),
                              Text(
                                '최근 일기 30개',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff6B6B6B),
                                ),
                              ),
                              Container( height:1.0,
                                width:MediaQuery.of(context).size.width * 0.2,
                                color:Color(0xff6B6B6B),),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: MediaQuery.of(context).size.width * 0.6,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xFF8DBFD2),),
                                    borderRadius:BorderRadius.circular(20)
                                ),
                              ),
                              Positioned(
                                left: MediaQuery.of(context).size.width * 0.03,
                                top: MediaQuery.of(context).size.height * 0.01,
                                child: Text(
                                    '일별 한국어 사용 비율',
                                    style: TextStyle(
                                      color: Color(0xff6B6B6B),
                                      fontSize:15,
                                    )
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.13,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
