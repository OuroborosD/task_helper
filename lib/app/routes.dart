import 'package:flutter/cupertino.dart';
import 'package:task_helper/app/views/pages/home_page.dart';
import 'package:task_helper/app/views/pages/task_page.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes= {
  '/':(context)=>  HomePage(),// não pode ter 
  '/taskscreen':(context)=> TaskPage(),
};