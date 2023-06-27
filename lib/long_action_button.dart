import 'dart:async';

import 'package:flutter/material.dart';

class LongClickOnFloatingActionButton extends StatefulWidget {
  const LongClickOnFloatingActionButton({super.key});

  @override
  LongClickOnFloatingActionButtonState createState() => LongClickOnFloatingActionButtonState();
}

class LongClickOnFloatingActionButtonState extends State<LongClickOnFloatingActionButton> {
  late Timer _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {

          setState(() {
            _start++;
          });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text(_start.toString() ,style: TextStyle(fontSize: 48),)),

         ),
        floatingActionButton: GestureDetector(
          onLongPressStart: (_) async{
            startTimer();
          },
          onLongPressEnd: (_){
            _timer.cancel();
        },
          child: const FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.add),
          ),
      ),
    );
  }

}