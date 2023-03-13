// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_day2/constant.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Bottom Navigation Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _animation = 'chatHover';

  void setIcon(Offset offset) {
    if (offset.dy >= animHeightMin && offset.dy <= animHeightMax) {
      if (offset.dx >= homeWidthMin && offset.dx <= homeWidthMax) {
        setState(() {
          _animation = 'homeHover';
        });
      } else if (offset.dx >= userWidthMin && offset.dx <= userWidthMax) {
        setState(() {
          _animation = 'networkHover';
        });
      } else if (offset.dx >= jobWidthMin && offset.dx <= jobWidthMax) {
        setState(() {
          _animation = 'jobsHover';
        });
      } else if (offset.dx >= messageWidthMin && offset.dx <= messageWidthMax) {
        setState(() {
          _animation = 'chatHover';
        });
      } else if (offset.dx >= notificationWidthMin &&
          offset.dx <= notificationWidthMax) {
        setState(() {
          _animation = 'notificationsHover';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTapUp: (e) {
            print(e.localPosition);
            setIcon(e.localPosition);
          },
          child: RiveAnimation.asset(
            'assets/icons.riv',
            animations: [_animation],
          ),
        ),
      ],
    );
  }
}
