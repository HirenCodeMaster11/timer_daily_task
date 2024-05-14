import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class digitalClock extends StatefulWidget {
  const digitalClock({super.key});

  @override
  State<digitalClock> createState() => _digitalClockState();
}

class _digitalClockState extends State<digitalClock> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(() {
          dateTime = DateTime.now();
        });
      },
    );
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/i.jpg',
            ),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 58,
            ),
            Text(
              'Alarm',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 230,
            ),
            Icon(
              Icons.notifications_active,
              color: Colors.white,
              size: 45,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '${(dateTime.hour % 12).toString().padLeft(2, '0')}:${(dateTime.minute).toString().padLeft(2, '0')}:${(dateTime.second).toString().padLeft(2, '0')} ${dateTime.hour < 12 ? 'AM' : 'PM'}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '${days[dateTime.weekday - 1]} ${dateTime.day} ${month[dateTime.month - 1]}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () {},
                    child: Text(' Snooze ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20))),
                SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text('Dismiss',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20))),
              ],
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 70,
              child: Icon(Icons.fiber_dvr,size: 34,color: Colors.grey,),
            ),
            SizedBox(width: 38,),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/analog');
              },
              child: Container(
                height: 60,
                width: 70,
                child: Icon(Icons.watch_later_outlined,size: 34,color: Colors.grey,),
              ),
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

late String day;

List days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];

List month = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];
