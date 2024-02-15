import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 날짜 형식을 사용하기 위한 패키지

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _selectedDate = DateTime.now();
  // 일기가 작성된 날짜들
  // 일기가 작성되어 있으면 _markedDates를 true로
  final Map<DateTime, bool> _markedDates = {
    DateTime(2024, 1, 5): true,
    DateTime(2024, 2, 5): true,
    DateTime(2024, 2, 9): true,
  };

  @override
  Widget build(BuildContext context) {
    final selectedDateInfo = DateFormat('yyyy / MM / dd (E) ').format(_selectedDate); // 선택된 날짜의 정보를 포맷합니다.

    return Scaffold(
      backgroundColor: Color(0xFF8DBFD2),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          // 달력을 표시하는 위젯
          _buildCalendar(),

          // 선택된 날짜에 대한 정보를 표시하는 카드(부모 일기)를 호출합니다.
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            padding: EdgeInsets.all(8),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Text(
                          "Diary",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFF8DBFD2),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      DateFormat('yyyy / MM / dd (E) ').format(_selectedDate ?? DateTime.now()),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color(0xFF8DBFD2),
                        fontSize:20,
                      )
                    ),
                  ],
                ),
                _buildSelectedDateCard_pd(),
                // 선택된 날짜에 대한 정보를 표시하는 카드(아이 일기)를 호출합니다.
                _buildSelectedDateCard_cd(),
                //SizedBox(height: MediaQuery.of(context).size.width * 0.2,)
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 달력의 헤더 부분에 연도와 월을 표시
  Widget _buildCalendarHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            setState(() {
              _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
            });
          },
        ),
        Column(
          children: [
            Text(
              '${DateFormat('yyyy').format(_selectedDate)}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '${DateFormat('MMMM').format(_selectedDate)}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.white,
          onPressed: () {
            setState(() {
              _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
            });
          },
        ),
      ],
    );
  }

  // 요일을 표시하는 위젯을 정의합니다.
  Widget _buildWeekdays() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        DateTime.daysPerWeek,
            (index) {
          // 요일을 일요일부터 표시하도록 index 조정
          final adjustedIndex = (index + 1) % DateTime.daysPerWeek;
          return Text(
            DateFormat('EEEEE').format(DateTime(2024, 1, adjustedIndex == 0 ? 7 : adjustedIndex)),
            // 각 요일을 표시합니다.
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          );
        },
      ),
    );
  }

  // 달력을 표시하는 위젯을 정의합니다.
  Widget _buildCalendar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.6,
      margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01), // 위젯 외부 여백을 설정합니다.
      padding: EdgeInsets.all(8), // 위젯 내부 여백을 설정합니다.
      child: Column(
        children: [
          // 달력의 헤더 부분에 연도와 월을 표시하는 위젯을 호출합니다.
          _buildCalendarHeader(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
          // 요일을 표시하는 위젯을 호출합니다.
          _buildWeekdays(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01,), // 위젯 간격을 설정합니다.
          // 날짜를 표시하는 그리드뷰를 호출합니다.
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), // 스크롤 x
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7, // 한 줄에 7개의 요일을 표시
            ),
            itemCount: DateTime.daysPerWeek * 5, // 5주를 표시
            itemBuilder: (context, index) {
              final currentDate = DateTime(_selectedDate.year, _selectedDate.month, 1)
                  .subtract(Duration(days: DateTime(_selectedDate.year, _selectedDate.month, 1).weekday - 1))
                  .add(Duration(days: index));

              final isToday = currentDate.year == DateTime.now().year &&
                  currentDate.month == DateTime.now().month &&
                  currentDate.day == DateTime.now().day;

              // 선택된 날짜의 여부를 확인합니다.
              final isSelected = currentDate.year == _selectedDate.year &&
                  currentDate.month == _selectedDate.month &&
                  currentDate.day == _selectedDate.day;

              // 선택된 날짜에 해당하는 일기 여부를 확인합니다.
              final writeDiary = _markedDates[currentDate] ?? false;

              // 전달과 다음달의 날짜인지 확인합니다.
              final isOutsideMonth = currentDate.month != _selectedDate.month;

              if (isOutsideMonth) {
                // 전달과 다음달의 날짜인 경우 빈 컨테이너를 반환합니다.
                return Container();
              }

              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedDate = currentDate;
                  });
                },
                child: Container(
                  //width: MediaQuery.of(context).size.width * 0.1,
                  //height: MediaQuery.of(context).size.height *0.1,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: isSelected ? Colors.white : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      // 일기를 작성한 날짜인 경우 다소리 표시하기
                      if (writeDiary)
                        Image.asset(
                          'assets/dasol.png',
                          width: 25,
                          height: 25,
                        ),
                      if (!writeDiary)
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                        ),
                      Text(
                        '${currentDate.day}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white :Colors.black ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // 부모 일기 카드
  Widget _buildSelectedDateCard_pd() {
    final selectedDateInfo = DateFormat('yyyy년 MM월 dd일').format(_selectedDate); // 선택된 날짜의 정보를 포맷합니다.
    final isDiaryWritten = _markedDates[_selectedDate] ?? false; // 선택된 날짜에 일기가 쓰여있는지 확인합니다.

    return Card(
      margin: EdgeInsets.all(8), // 카드의 외부 여백을 설정
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Color(0xFF8DBFD2), width: 2),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16,8,8,8), // 카드의 내부 여백을 설정
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '부모의 일기',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Text(
                  isDiaryWritten ? '일기가 쓰여 있는 날' : '일기가 쓰여 있지 않은 날',
                  style: TextStyle(fontSize: 12,),
                ),
              ],
            ),
            Container(
              width: 80,
              //height: 94,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ), //부모 일기 이미지
          ],
        ),
      ),
    );
  }

  // 아이 일기 카드
  Widget _buildSelectedDateCard_cd() {
    final selectedDateInfo = DateFormat('yyyy년 MM월 dd일').format(_selectedDate); // 선택된 날짜의 정보를 포맷합니다.
    final isDiaryWritten = _markedDates[_selectedDate] ?? false; // 선택된 날짜에 일기가 쓰여있는지 확인합니다.

    return Expanded(
      child: Card(
        margin: EdgeInsets.all(8), // 카드의 외부 여백을 설정
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Color(0xFF8DBFD2), width: 2),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16,8,8,8), // 카드의 내부 여백을 설정
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '아이의 일기',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Text(
                    isDiaryWritten ? '일기가 쓰여 있는 날' : '일기가 쓰여 있지 않은 날',
                    style: TextStyle(fontSize: 12,),
                  ),
                ],
              ),
              Container(
                width: 80,
                //height: 94,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ), //부모 일기 이미지
            ],
          ),
        ),
      ),
    );
  }
}
