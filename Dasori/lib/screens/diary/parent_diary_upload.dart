import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // 날짜 형식을 사용하기 위한 패키지

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  File? _image;
  final picker = ImagePicker();

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }

  // 이미지를 보여주는 위젯
  Widget showImage() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        getImage(ImageSource.gallery);
      },
      child: Container(
        color: const Color(0xffffffff),
        width: width,
        height: height * 0.45,
        child: _image == null
            ? Center(
            child: Container(
                width: width * 0.35,
                height: height * 0.35,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffEAEAEA),
                ),
                child: InkWell(
                  child: Image.asset("assets/gallery.png"),
                )
            )
        ) : Image.file(File(_image!.path)),),
    );
  }

  Widget inputText() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      color: const Color(0xff8DBFD2),
      width: width,
      height: height * 0.55,
      child: Column(
        children: [
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
          diaryWrite(),
          writeDone()
        ],
      ),
    );
  }

  Widget diaryWrite() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final maxLines = 8;

    return Padding(
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
            hintText: "오늘의 일기를 작성하세요. \n Hãy viết nhật ký hôm nay.",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(width * 0.05),
              ),
          ),
        ),
      ),
    );
  }

  Widget writeDone() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.02,
        margin: EdgeInsets.all(5),
        child: Center(
          child: Text('작성 완료'),
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
        body: SingleChildScrollView(
          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                showImage(),
                inputText(),
              ],
            )
        )

    );
  }
}