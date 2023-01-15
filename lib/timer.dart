import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myclock/main.dart';
import 'package:numberpicker/numberpicker.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int hour = 0;
  int min = 0;
  int sec = 0;
  bool started = true;
  bool stopped = true;
  bool cancletimer = false;
  int? time1;
  final dur = Duration(seconds: 1);
  String timetodisplay = "";

  void start() {
    setState(() {
      started = false;
      stopped = false;
    });

    time1 = ((hour * 3600) + (min * 60) + sec);

    Timer.periodic(dur, (Timer t) {
      setState(() {
        if (time1! < 1 || cancletimer == true) {
          t.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TimerPage(),
            ),
          );
        } else if (time1! < 60) {
          timetodisplay = time1.toString();
          time1 = time1! - 1;
        } else if (time1! < 3600) {
          int m = time1! ~/ 60;
          int s = time1! - (60 * m);
          timetodisplay = m.toString() + ":" + s.toString();
          time1 = time1! - 1;
        } else {
          int h = time1! ~/ 3600;
          int t = time1! - (3600 * h);
          int m = t ~/ 60;
          int s = t - (60 * m);
          timetodisplay =
              h.toString() + ":" + m.toString() + ":" + s.toString();
          time1 = time1! - 1;
        }
      });
    });
  }

  void stop() {
    setState(() {
      started = true;
      stopped = true;
      cancletimer = true;
      timetodisplay = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CupertinoButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              size: 20,
              color: Colors.orange.shade500,
            )),
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
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Timer",
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.002,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "HH",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        NumberPicker(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 20),
                          selectedTextStyle:
                              TextStyle(color: Colors.orange, fontSize: 24),
                          minValue: 0,
                          maxValue: 23,
                          value: hour,
                          onChanged: (val) {
                            setState(() {
                              hour = val;
                            });
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "MM",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        NumberPicker(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 20),
                          selectedTextStyle:
                              TextStyle(color: Colors.orange, fontSize: 24),
                          minValue: 0,
                          maxValue: 59,
                          value: min,
                          onChanged: (val) {
                            setState(() {
                              min = val;
                            });
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "SS",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        NumberPicker(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 20),
                          selectedTextStyle: TextStyle(
                              color: Colors.orange.shade500, fontSize: 24),
                          minValue: 0,
                          maxValue: 59,
                          value: sec,
                          onChanged: (val) {
                            setState(() {
                              sec = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  timetodisplay,
                  style: TextStyle(
                      color: Colors.orange.shade500,
                      fontSize: 50,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white24)),
                        onPressed: started ? start : null,
                        child: Text(
                          "Start",
                          style: TextStyle(
                              fontSize: 20, color: Colors.orange.shade500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white24)),
                        onPressed: stopped ? null : stop,
                        child: Text(
                          "Stop",
                          style: TextStyle(
                              fontSize: 20, color: Colors.orange.shade500),
                        ),
                      ),
                    ),
                  ],
                ),
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
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MyClock()),
                                ModalRoute.withName('/'),
                              );
                            },
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
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
                            onPressed: () {},
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
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
      ),
    );
  }
}
