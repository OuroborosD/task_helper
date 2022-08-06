import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 12, right: 12, top: 20),
        child: Column(
          children: [
            Slidable(
                child: Container(child: TextField()),
                endActionPane:
                    ActionPane(motion: const DrawerMotion(), children: [
                  SlidableAction(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    onPressed: (context) {},
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    icon: Icons.add,
                    label: "Adicionar",
                  ),
                ])),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("craido"),
                Text("craido"),
              ],
            ),
            Flexible(
                child: ListView(
              shrinkWrap: true,
            )),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: Icon(Icons.add, size: 30)))
          ],
        ),
      ),
    );
  }
}
