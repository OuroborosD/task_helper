import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task_helper/app/views/widgets/add_title.dart';
import 'package:task_helper/app/views/widgets/card_title.dart';

import '../../models/tasks_model.dart';
// resizeToAvoidBottomInset: false,

class HomePage extends StatelessWidget {
  HomePage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(children: [
            Flexible(
                flex: 2,
                child: CardAddTitle()),
            Flexible(
                flex: 8,
                child: ListView(
                  shrinkWrap: true,
              children: [
                  CardTaskHome()
              ],
            ))
          ]),
        ),
      ),
    );
  }
}
