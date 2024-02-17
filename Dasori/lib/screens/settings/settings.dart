import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart' ;

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            color: Colors.blue,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: PieChart(
              PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: 50,
                      title: '한국어 사용 비율',
                      radius: MediaQuery.of(context).size.width *0.25,
                      color: Colors.black,
                    ),
                    PieChartSectionData(
                      value: 50,
                      title: '사용 비율',
                      radius: MediaQuery.of(context).size.width *0.25,
                      color: Colors.blueGrey,
                    ),
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}

