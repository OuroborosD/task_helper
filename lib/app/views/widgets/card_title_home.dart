import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// extern
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task_helper/app/models/tasks_model.dart';

class CardTaskHome extends StatelessWidget {
  CardTaskHome({super.key, this.task});
  Tasks? task;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/taskscreen');
      },
      child: Card(
          child: Slidable(
              child: Container(
                height: 70,
                width: double
                    .infinity, // a largura sempre para ocupar toda a tela, e o slide não vir da metade, que ocupava anteriormente
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${task!.title}',
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('dd/MM/yyyy H:m:s E').format(task!.date_creation!),
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),

                  ],
                ),
              ),
              endActionPane:
                  ActionPane(motion: const DrawerMotion(), children: [
                SlidableAction(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  onPressed: (context) {},
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: "Deletar",
                ),
              ]))),
    );
  }
}
