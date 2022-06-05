import 'dart:async';

import 'package:flutter/material.dart';

import 'login_form.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    scaleAnimation = CurvedAnimation(
      parent: controller!,
      curve: Curves.easeInToLinear,
    );
    controller!.addListener(() {
      setState(() {});
    });
    controller!.forward();
    _splashTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff001f20),
      body: Center(
        child: ScaleTransition(
            scale: scaleAnimation!,
            child: Image.asset("assets/CodeSeek (1).png")),
      ),
    );
  }
}

Future<Timer> _splashTimer(context) async {
  return Timer(const Duration(seconds: 3), () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginForm(),
      ),
    );
  });
}
