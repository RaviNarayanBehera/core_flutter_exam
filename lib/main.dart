import 'package:core_flutter_exam/Screen/detail_page.dart';
import 'package:core_flutter_exam/Screen/home_screen.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) =>  HomePage(),
        '/detail' : (context) =>  AddDataPage(),

      },
    );
  }
}
