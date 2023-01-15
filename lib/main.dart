import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myclock/alarm.dart';
import 'package:myclock/stopwatch.dart';
import 'package:myclock/timer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => MyClock(),
        'alarm': (context) => AlarmPage(),
        'stopwatch': (context) => StopwatchPage(),
        'timer': (context) => TimerPage(),
      },
    ),
  );
}

class MyClock extends StatefulWidget {
  const MyClock({Key? key}) : super(key: key);

  @override
  State<MyClock> createState() => _MyClockState();
}

class _MyClockState extends State<MyClock> {
  double sec = 00;
  double min = 00;
  double hour = 00;
  Timer? timer1;
  String Am = "AM";
  String Pm = "PM";

  String time() {
    return "${DateTime.now().hour < 10 ? "0${DateTime.now().hour}" : DateTime.now().hour % 12} : "
        "${DateTime.now().minute < 10 ? "0${DateTime.now().minute}" : DateTime.now().minute} : "
        "${DateTime.now().second < 10 ? "0${DateTime.now().second}" : DateTime.now().second} ";
  }

  controlSeconds() {
    timer1 = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(() {
        sec = (DateTime.now().second / 60);
      }),
    );
  }

  controlMinutes() {
    timer1 = Timer.periodic(
      Duration(minutes: 1),
      (Timer timer) => setState(() {
        min = (DateTime.now().minute / 60);
      }),
    );
  }

  controlHour() {
    timer1 = Timer.periodic(
      Duration(hours: 1),
      (Timer timer) => setState(() {
        hour = (DateTime.now().hour / 24);
      }),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sec = (DateTime.now().second / 60);
    controlSeconds();
    min = (DateTime.now().minute / 60);
    controlMinutes();
    hour = (DateTime.now().hour % 12);
    controlHour();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Container(
          alignment: Alignment.center,
          child: Text(
            "Edit",
            style: TextStyle(fontSize: 20,color: Colors.orange.shade500),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.black,
        toolbarHeight: 40,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.add,
              color: Colors.orange.shade500,
              size: 30,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "Clock",
                style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.002,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(0.52, -0.17),
                      child: Text(
                        (hour == 0) ? Am : Pm,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(36.0),
                        width: 360,
                        height: 360,
                        child: Center(
                          child: Text(
                            time(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: CircularPercentIndicator(
                        radius: 240,
                        lineWidth: 10,
                        percent: sec,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Colors.orange.shade500,
                        backgroundColor: Colors.white24,
                      ),
                    ),
                    Center(
                      child: CircularPercentIndicator(
                        radius: 290,
                        lineWidth: 10,
                        percent: min,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Colors.orange.shade500,
                        backgroundColor: Colors.white24,
                      ),
                    ),
                    Center(
                      child: CircularPercentIndicator(
                        radius: 340,
                        lineWidth: 10,
                        percent: hour / 12,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Colors.orange.shade500,
                        backgroundColor: Colors.white24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.002,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  DateFormat.yMMMEd().format(DateTime.now()),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.002,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          onPressed: () {},
                          child: Column(
                            children: [
                              Icon(
                                CupertinoIcons.globe,
                                size: 35,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "My Clock",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'alarm');
                          },
                          child: Column(
                            children: [
                              Icon(
                                CupertinoIcons.alarm,
                                size: 35,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Alarm",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'stopwatch');
                          },
                          child: Column(
                            children: [
                              Icon(
                                CupertinoIcons.stopwatch,
                                size: 35,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Stopwatch",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'timer');
                          },
                          child: Column(
                            children: [
                              Icon(
                                CupertinoIcons.timer,
                                size: 35,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Timer",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
