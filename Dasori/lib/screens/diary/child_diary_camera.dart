import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // 날짜 형식을 사용하기 위한 패키지

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
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
        getImage(ImageSource.camera);
      },
      child: Container(
        color: const Color(0xFF8DBFD2),
        width: width,
        height: height * 0.45,
        child: _image == null
            ? Center(
            child: Container(
                width: width * 0.35,
                height: height * 0.35,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: InkWell(
                  child: Image.asset("assets/gallery.png"),
                )
            )
        ) : Image.file(File(_image!.path)),),
    );
  }

  Widget cameraGuide() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      color: const Color(0xFFFFFFFF),
      width: width,
      height: height * 0.55,
      child: Column(
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
            Text(
                "--------------------------- 촬영 가이드 ---------------------------",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xff787B7D),
                  fontSize: height * 0.025,
                )
            ),
            SizedBox(height: height * 0.002),
            Row(
              children: [
                SizedBox(width: width * 0.15),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '1. 글씨가 잘 보이도록 밝은 곳에서 촬영해주세요. \n',
                        style: TextStyle(color: Color(0xff787B7D), fontSize: height * 0.02, ),
                      ),
                      TextSpan(
                        text: 'Hãy quay ở nơi sáng để thấy rõ chữ nhé. \n',
                        style: TextStyle(color: Color(0xff8DBFD2), fontSize: height * 0.02),
                      ),
                      TextSpan(
                        text: '2. 아이 일기를 촬영 영역에 맞춰주세요.\n',
                        style: TextStyle(color: Color(0xff787B7D), fontSize: height * 0.02),
                      ),
                      TextSpan(
                        text: 'Hãy điều chỉnh nhật ký cho phù hợp với \nlĩnh vực ghi hình.\n',
                        style: TextStyle(color: Color(0xff8DBFD2), fontSize: height * 0.02),
                      ),
                      TextSpan(
                        text: '3. 표시된 빨간선이 그림과 글씨 사이에 위치하도록 \n맞추고 촬영해주세요. \n',
                        style: TextStyle(color: Color(0xff787B7D), fontSize: height * 0.02),
                      ),
                      TextSpan(
                        text: 'Hãy điều chỉnh và chụp sao cho đường màu đỏ \nđược hiển  thị nằm giữa hình ảnh và chữ viết. \n',
                        style: TextStyle(color: Color(0xff8DBFD2), fontSize: height * 0.02),
                      ),
                    ],
                  ),
                ),
              ],
            )

          //   Column(
          //     children: [
          //       Row(
          //           children: [
          //             SizedBox(width: width * 0.15),
          //             Text(
          //                 "1. 글씨가 잘 보이도록 밝은 곳에서 촬영해주세요. \n",
          //                 textAlign: TextAlign.start,
          //                 style: TextStyle(
          //                   color: Color(0xff787B7D),
          //                   fontSize: height * 0.02,
          //                 )
          //             ),
          //           ]
          //       ),
          //       Row(
          //           children: [
          //             SizedBox(width: width * 0.15),
          //             Text(
          //                 "Hãy quay ở nơi sáng để thấy rõ chữ nhé.\n",
          //                 textAlign: TextAlign.start,
          //                 style: TextStyle(
          //                   color: Color(0xff8DBFD2),
          //                   fontSize: height * 0.02,
          //                 )
          //             ),
          //           ]
          //       ),
          //       Row(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           SizedBox(width: width * 0.15),
          //           Text(
          //             "2. 아이 일기를 촬영 영역에 맞춰주세요. \n",
          //             textAlign: TextAlign.start,
          //             style: TextStyle(
          //               color: Color(0xff787B7D),
          //               fontSize: height * 0.02,
          //             ),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           SizedBox(width: width * 0.15),
          //           Text(
          //             "Hãy điều chỉnh nhật ký cho phù hợp \nvới lĩnh vực ghi hình.",
          //             textAlign: TextAlign.start,
          //             style: TextStyle(
          //               color: Color(0xff8DBFD2),
          //               fontSize: height * 0.02,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   )
          // ]
        ],
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
                cameraGuide(),
              ],
            )
        )

    );
  }
}