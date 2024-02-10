import 'package:flutter/material.dart';
import 'package:screenproject/addnote.dart';
import 'package:screenproject/allnote.dart';
import 'package:screenproject/dataShow.dart';
import 'package:screenproject/homepage.dart';
import 'package:screenproject/login.dart';
import 'package:screenproject/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const homepage(),
        '/addNote': (context) => const addNote(),
        '/allNote' : (context) => const allNote(),
        '/login' : (context) => const login(),
        '/register' : (context) => register(),
      },
      // home: homepage(),
    );
  }
}