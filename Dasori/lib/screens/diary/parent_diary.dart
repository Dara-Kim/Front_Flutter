import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart'; // 날짜 형식을 사용하기 위한 패키지


class ParentDone extends StatefulWidget {
  const ParentDone({Key? key}) : super(key: key);

  @override
  _ParentDoneState createState() => _ParentDoneState();
}

class _ParentDoneState extends State<ParentDone> {
  // 여기에 이미지 받아와서 담아둘 변수 설정
  // 현재는 아무 파일 받아옴 <- assets/example0.png

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
    final maxLines = 8;

    return Column(
      children: [
        Container(
          //width: width,
          //height: height * 0.55,
          color: const Color(0xFF8DBFD2),
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
                              color: Colors.white,
                              fontSize: height * 0.02,
                            )
                        ),
                      ],
                    ),
                    Row(
                        children: [
                          SizedBox(width: width * 0.05),
                          Text(
                              "엄마의 일기",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: height * 0.03,
                              )
                          ),
                        ]
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        SizedBox(width: width * 0.05),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '변경된 일기',
                          style: TextStyle(fontSize: height * 0.02, color: Colors.white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.01),
                      // TextField 스크롤 되도록 바꾸기
                      child: Container(
                        width: width, // <-- TextField width
                        height: height * 0.3, // <-- TextField height
                        child: TextField(
                          maxLines: maxLines,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.05),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        SizedBox(width: width * 0.05),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '변경된 일기',
                          style: TextStyle(fontSize: height * 0.02, color: Colors.white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.01),
                      // TextField 스크롤 되도록 바꾸기
                      child: Container(
                        width: width, // <-- TextField width
                        height: height * 0.3, // <-- TextField height
                        child: TextField(
                          maxLines: maxLines,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.05),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
          ),
        ),
      ],
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              showImage(),
              showDiary(),
            ],
          ),
        ),
    );
  }
}
