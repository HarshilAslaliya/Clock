import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        toolbarHeight: 40,
        leading: CupertinoButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              size: 20,
              color: Colors.orange.shade500,
            )),
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
            const Text(
              "Alarm",
              style: TextStyle(
                fontSize: 45,
                color: Colors.white,
                fontWeight: FontWeight.w700,
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
              flex: 2,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.84,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white10,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          width: 70,
                          child: ListWheelScrollView.useDelegate(
                            perspective: 0.005,
                            diameterRatio: 1.4,
                            physics: FixedExtentScrollPhysics(),
                            itemExtent: 50,
                            childDelegate: ListWheelChildBuilderDelegate(
                                childCount: 12,
                                builder: (context, index) {
                                  return h1(mins: index);
                                }),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 70,
                          child: ListWheelScrollView.useDelegate(
                            perspective: 0.005,
                            diameterRatio: 1.4,
                            physics: FixedExtentScrollPhysics(),
                            itemExtent: 50,
                            childDelegate: ListWheelChildBuilderDelegate(
                                childCount: 60,
                                builder: (context, index) {
                                  return h1(mins: index);
                                }),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 70,
                          child: ListWheelScrollView.useDelegate(
                            perspective: 0.005,
                            diameterRatio: 1.2,
                            physics: FixedExtentScrollPhysics(),
                            itemExtent: 50,
                            childDelegate: ListWheelChildBuilderDelegate(
                                childCount: 2,
                                builder: (context, index) {
                                  if (index == 0) {
                                    return h2(isAmPm: true);
                                  } else {
                                    return h2(isAmPm: false);
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white54, width: 2)),
                  alignment: Alignment.center,
                  child: Text(
                    "Set",
                    style: TextStyle(fontSize: 20, color: Colors.orange.shade500),
                  ),
                ),
              ),
            ),
            Spacer(),
            Expanded(
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
                            Navigator.pop(context);
                          },
                          child: Column(
                            children: [
                              Icon(
                                CupertinoIcons.globe,
                                size: 35,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 7,),
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
                          onPressed: () {},
                          child: Column(
                            children: [
                              Icon(
                                CupertinoIcons.alarm,
                                size: 35,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 5,),
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
                              SizedBox(height: 5,),
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
                              SizedBox(height: 5,),
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

  Widget h1({
    required mins,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            mins < 10 ? '0' + mins.toString() : mins.toString(),
            style: TextStyle(
              fontSize: 27,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget h2({required bool isAmPm}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            isAmPm == true ? 'am' : 'pm',
            style: TextStyle(
              fontSize: 27,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
