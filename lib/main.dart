import 'package:flutter/material.dart'; 
import 'dart:ui' as ui;
import 'package:flutter_application_1/screen/home.dart';

void main() {
  print("Using Impeller: ${ui.PlatformDispatcher.instance.views.toString()}");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner : false,
      home: const HomeScreen(),
    );
  }
}

