import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 날짜 형식을 사용하기 위한 패키지
import 'dart:math';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> with TickerProviderStateMixin {

  late TabController reportTabController; // 탭 컨트롤러 선언
  final double percentage=0.5; // 백분율 값

  //CircleGraphPainter({required this.percentage});

  @override
  void initState() {
    super.initState();
    reportTabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          backgroundColor: Color(0xFF8DBFD2),
          title: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(text: '일기 통계\nthống kê bố mẹ', style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                //부모 일기 아이 일기 탭
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  color: Color(0xFF8DBFD2),
                  child: TabBar(
                    controller: reportTabController,
                    tabs: [
                      Tab(
                        child: Text(
                          '부모\nnhật ký của bố',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: reportTabController.index == 0 ? Colors.black : Colors.green,
                            fontSize: 14,
                            ),
                          ),
                        ),
                      Tab(
                        child: Text(
                          '아이\nnhật ký trẻ con',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: reportTabController.index == 1 ? Colors.black : Colors.green,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

                //TODAY
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    Container( height:1.0,
                      width:MediaQuery.of(context).size.width * 0.35,
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
                      width:MediaQuery.of(context).size.width * 0.35,
                      color:Color(0xff6B6B6B),),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
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
                            '일별 한국어 교정 비율',
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

                //최근 일기 7개
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container( height:1.0,
                      width:MediaQuery.of(context).size.width * 0.25,
                      color:Color(0xff6B6B6B),),
                    Text(
                      '최근 일기 7개',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff6B6B6B),
                      ),
                    ),
                    Container( height:1.0,
                      width:MediaQuery.of(context).size.width * 0.25,
                      color:Color(0xff6B6B6B),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
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
                    Container( height:1.0,
                      width:MediaQuery.of(context).size.width * 0.25,
                      color:Color(0xff6B6B6B),),
                    Text(
                      '최근 일기 30개',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff6B6B6B),
                      ),
                    ),
                    Container( height:1.0,
                      width:MediaQuery.of(context).size.width * 0.25,
                      color:Color(0xff6B6B6B),),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.width * 0.8,
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.width * 0.8,
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
    );
  }
}



class CircleGraphPainter extends CustomPainter {
  final double percentage; // 백분율 값

  CircleGraphPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    canvas.drawCircle(center, radius, paint);

    final sweepAngle = 2 * pi * percentage / 100;
    final paintFill = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      true,
      paintFill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


