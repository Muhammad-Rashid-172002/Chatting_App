import 'package:chatting_app/views/Screens/Home/Onborad_Screen/screen1.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:chatting_app/views/Screens/auth_module/LoginScreen.dart';

class Splasscreen extends StatefulWidget {
  const Splasscreen({super.key});

  @override
  State<Splasscreen> createState() => _SplasscreenState();
}

class _SplasscreenState extends State<Splasscreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Screen1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animation/11.json'),
            SizedBox(height: 20),
            Text(
              'Welcome\nTo Chatting App!!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
            SizedBox(height: 20),
            LoadingAnimationWidget.threeArchedCircle(
              color: Colors.white,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
