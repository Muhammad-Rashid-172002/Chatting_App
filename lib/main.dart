import 'package:chatting_app/views/Screens/auth_module/LoginScreen.dart';
import 'package:chatting_app/views/Screens/Home/chatting_Screen.dart';
import 'package:chatting_app/views/Screens/Home/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:chatting_app/views/Screens/chat_screen/chatting_Screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Splasscreen()
        //LoginScreen()
        //ChattingScreen()
        );
  }
}
