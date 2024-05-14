import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Digital Clock/DigitalClock.dart';

class Strap extends StatefulWidget {
  const Strap({super.key});

  @override
  State<Strap> createState() => _StrapState();
}

class _StrapState extends State<Strap> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
    return Scaffold(
      backgroundColor: Color(0xff222831),
      // appBar: AppBar(
      //   backgroundColor: Colors.black87,
      //   centerTitle: true,
      //   toolbarHeight: 85,
      //   title: const Text(
      //     'Strap Watch',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontFamily: 'Digital',
      //       fontWeight: FontWeight.bold,
      //       fontSize: 40,
      //     ),
      //   ),
      // ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 270, bottom: 90,left: 53),
            height: 302,
            width: 302,
            child: CircularProgressIndicator(
              value: dateTime.second / 60,
              color: Colors.orange,
              strokeWidth: 8,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 270, bottom: 90,left: 53),
            height: 280,
            width: 280,
            child: CircularProgressIndicator(
              value: dateTime.minute / 60,
              color: Colors.white,
              backgroundColor: Colors.white10,
              strokeWidth: 14,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 270, bottom: 90,left: 53),
            height: 250,
            width: 250,
            child: CircularProgressIndicator(
              value: (dateTime.hour%12) / 12,
              color: Colors.green,
              strokeWidth: 18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:100,left: 50),
            child: Text(
              '${(dateTime.hour > 12) ?(dateTime.hour % 12).toString().padLeft(2, '0'):(dateTime.hour).toString().padLeft(2, '0')}:${(dateTime.minute).toString().padLeft(2, '0')}:${(dateTime.second).toString().padLeft(2, '0')}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 168, left: 50),
            child: Text(
              (dateTime.hour > 12) ? 'PM' : 'AM',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 230,left: 48),
            child: Text('${days[dateTime.weekday-1]} ${dateTime.day} ${month[dateTime.month - 1]}',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500),),
          ),
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
            Container(
              height: 60,
              width: 70,
              child: Icon(Icons.timelapse,size: 34,color: Colors.grey,),
            ),
          ],
        ),
      ),
    );
  }
}
DateTime dateTime = DateTime.now();
String am = 'AM';
String pm = 'PM';
