import 'package:charts/controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List data = [];
  void getDatanya() {
    Controller.getIndex().then((value) {
      data = value;
    });
  }

  @override
  void initState() {
    getDatanya();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beranda"),
        centerTitle: true,
      ),
      body: Container(
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(enabled: true),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  for (var i = 0; i < data.length; i++) ...{
                    FlSpot((i + 1).toDouble(), data[i]['KASUS'].toDouble()),
                  }
                ],
                isCurved: true,
                barWidth: 2,
                colors: [
                  Colors.orange,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
