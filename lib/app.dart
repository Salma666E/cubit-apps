import 'package:counterapp_cubit/timer/view/timer_page.dart';
import 'package:flutter/material.dart';

import 'counter/view/counter_page.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimerPage(),
      // CounterPage(),
    );
  }
}
