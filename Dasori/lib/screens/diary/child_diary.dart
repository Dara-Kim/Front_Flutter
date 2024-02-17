import 'package:Front_Flutter/screens/conversation/conversation.dart';
import 'package:Front_Flutter/screens/diary/child_diary_camera.dart';
import 'package:Front_Flutter/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class ChildDone extends StatefulWidget {
  const ChildDone({Key? key}) : super(key: key);

  @override
  _ChildDoneState createState() => _ChildDoneState();
}

class _ChildDoneState extends State<ChildDone> {
  // 여기에 이미지 받아와서 담아둘 변수 설정
  // 현재는 아무 파일 받아옴 <- assets/example0.png
  //통신 URL: /home/conversation
  //통신: pid(variable.dart 내), date

  Widget showImage() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height * 0.45,
      child: Container(
        child: Image.asset(
            'assets/example0.png',
            fit: BoxFit.cover
            // 클릭하면 이미지만 확인하게 하는 코드 추가
        ),
      ),
    );
  }

  Widget showDiary() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        SizedBox(width: width * 0.05),
                        Text(
                            DateFormat('yyyy년 MM월 dd일 EEEE').format(DateTime.now()),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color(0xff787B7D),
                              fontSize: height * 0.02,
                            )
                        ),
                      ],
                    ),
                    Row(
                        children: [
                          SizedBox(width: width * 0.05),
                          Text(
                              "아이의 일기",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color(0xff787B7D),
                                fontSize: height * 0.03,
                              )
                          ),
                        ]
                    ),
                    SizedBox(height: height * 0.02),

                    // 변경된 일기 보여주는 Container 부분
                    Row(
                      children: [
                        SizedBox(width: width * 0.05),
                        Row(
                            children: [
                              SizedBox(width: width * 0.02),
                              Container(
                                width: width * 0.865,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(width * 0.05),
                                  border: Border.all(color: Color(0xff8DBFD2)),
                                ),
                                child: Column(
                                  children: [
                                    // 박스 내부 위 간격
                                    SizedBox(height: height * 0.02),
                                    Row(
                                      children: [
                                        SizedBox(width: width * 0.05),
                                        Container(
                                          width: width * 0.76,
                                          // Text 박스 사이즈 변경
                                          height: 10 * (height * 0.02 * 1.2),
                                          child: SingleChildScrollView(
                                            child: Text(
                                              // 줄 바꿈 테스트, 줄 바꿈 테스트, 줄 바꿈 테스트, 줄 바꿈 테스트, 줄 바꿈 테스트, 줄 바꿈 테스트, 줄 바꿈 테스트, 줄 바꿈 테스트, 줄 바꿈 테스트, 줄 바꿈 테스트, 줄 바꿈 테스트, 줄 바꿈 테스트, 줄 바꿈 테스트, 줄 바꿈 테스트, 줄 바꿈 테스트,
                                              '',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: height * 0.02,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: width * 0.05), // 오른쪽 간격
                                      ],
                                    ),
                                    // 박스 내부 아래 간격
                                    SizedBox(height: height * 0.02),
                                  ],
                                ),

                              ),
                            ],
                          ),
                      ]
                    ),
                    
                    SizedBox(height: height * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: width * 0.02),
                        writeDone(),
                        SizedBox(width: width * 0.02),
                      ],
                    ),
                    SizedBox(height: height * 0.05),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }

  Widget writeDone() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width * 0.8,
      height: height * 0.08,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xff8DBFD2),
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: TextButton(
        onPressed: () {
          // 여기에 부모 일기 작성하는 통신 추가
          // URL: /home/child
          Navigator.push(
            context,
            // 여기 NavBar 또 없어짐
            MaterialPageRoute(builder: (context) => Conversation()),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '소통하러 가기',
              style: TextStyle(color: Colors.white, fontSize: height * 0.023),
            ),
            SizedBox(width: 0),
            Text(
              'Quay hình xong',
              style: TextStyle(color: Colors.white, fontSize: height * 0.015),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // 화면 세로 고정
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
      // 키보드 overflow 방지
      // resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xfff4f3f9),
        body: Expanded(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  showImage(),
                  showDiary(),
                ],
              ),
            ),
          ),

        )
    );
  }
}
