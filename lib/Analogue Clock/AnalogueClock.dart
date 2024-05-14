import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:time_daily_task/Digital%20Clock/DigitalClock.dart';

class analogueClock extends StatefulWidget {
  const analogueClock({super.key});

  @override
  State<analogueClock> createState() => _analogueClockState();
}

class _analogueClockState extends State<analogueClock> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 70,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${(dateTime.hour > 12) ?(dateTime.hour % 12).toString().padLeft(2, '0'):(dateTime.hour).toString().padLeft(2, '0')}:${(dateTime.minute).toString().padLeft(2, '0')}:${(dateTime.second).toString().padLeft(2, '0')}',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 54,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12, left: 6),
                    child: Text(
                      (dateTime.hour > 12) ? 'PM' : 'AM',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${days[dateTime.weekday-1]} ${dateTime.day} ${month[dateTime.month - 1]}',style: TextStyle(color: Color(0xff00ADB5),fontSize: 32,fontWeight: FontWeight.bold),),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 100, bottom: 190),
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 13,
                      width: 13,
                      decoration: const BoxDecoration(
                          color: Color(0xff00ADB5),
                          shape: BoxShape.circle),
                    ),
                    ...List.generate(
                      60,
                          (index) => Transform.rotate(
                        angle: ((index) * 6 * pi) / 180,
                        child: ((index) % 5 == 0)
                            ? const VerticalDivider(
                          thickness: 3.7,
                          color: Color(0xff00ADB5),
                          endIndent: 285,
                        )
                            : const VerticalDivider(
                          thickness: 2,
                          color: Colors.grey,
                          endIndent: 292,
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: (dateTime.hour + (dateTime.minute / 60)) *
                          30 *
                          pi /
                          180,
                      child: const VerticalDivider(
                        thickness: 4,
                        color: Color(0xffEEEEEE),
                        indent: 50,
                        endIndent: 95,
                      ),
                    ),
                    Transform.rotate(
                      angle: (dateTime.minute * 6 * pi) / 180,
                      child: const VerticalDivider(
                        thickness: 3,
                        color: Color(0xff00ADB5),
                        indent: 35,
                        endIndent: 98,
                      ),
                    ),
                    Transform.rotate(
                      angle: (dateTime.second * 6 * pi) / 180,
                      child: const VerticalDivider(
                        thickness: 2,
                        color: Colors.grey,
                        indent: 25,
                        endIndent: 98,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff222831),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
              child: Container(
                height: 60,
                width: 70,
                child: Icon(Icons.fiber_dvr,size: 34,color: Colors.grey,),
              ),
            ),
            SizedBox(width: 38,),
            Container(
              height: 60,
              width: 70,
              child: Icon(Icons.watch_later_outlined,size: 34,color: Colors.grey,),
            ),
            SizedBox(width: 38,),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/strap');
              },
              child: Container(
                height: 60,
                width: 70,
                child: Icon(Icons.timelapse,size: 34,color: Colors.grey,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
DateTime dateTime = DateTime.now();