import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Analogue Clock/AnalogueClock.dart';
import 'Digital Clock/DigitalClock.dart';

void main()
{
  runApp(ClockApp());
}

class ClockApp extends StatelessWidget {
  const ClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => digitalClock(),
        '/analog' : (context) => analogueClock(),
      },
    );
  }
}
