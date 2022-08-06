import 'package:flutter/material.dart';
import 'package:task_helper/app/views/pages/home_page.dart';

void main() => runApp(Main());



class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: HomePage()),
    );
  }
}