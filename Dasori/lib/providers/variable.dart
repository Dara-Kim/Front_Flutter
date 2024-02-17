import 'package:Front_Flutter/screens/report/report.dart';

//pid, date,등등

//백에서 받은 변수들을 특정 dart 파일에 모아놓고 , 필요할 때 마다 그 파일을 참조해서 변수 값을 받아오려고 해. 그 파일 이름은 variable.dart파일이야

class Variables {
  static int pid = 1; // 사용자의 dasori_id를 저장하는 변수
  static DateTime selectedDate = DateTime.now(); // 선택된 날짜를 저장하는 변수
  static Map<DateTime, bool> markedDates = {}; // 표시된 날짜를 저장하는 변수

  // 서버로부터 받은 데이터 저장할 변수들
  static Map<String, int> pdDay1Report = {}; // pd_day1_report
  static Map<String, dynamic> pdDay7Report = {}; // pd_day7_report
  static Map<String, dynamic> pdDay30Report = {}; // pd_day30_report
}
