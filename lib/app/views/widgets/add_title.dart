import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../pages/task_page.dart';


class CardAddTitle extends StatelessWidget {
  const CardAddTitle({super.key});

  @override
  Widget build(BuildContext context) {
  //FIXME o texto passa completo para o outro lado  quando slida
    return Card(
      elevation: 6,
      child: Slidable(
        child: Container(
          height: 80,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Quantidade de tarefas pendentes", textAlign: TextAlign.center, overflow: TextOverflow.fade,),
            ],
          ),
        ),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
              padding: EdgeInsets.symmetric(vertical: 10),
              onPressed: (context){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> TaskPage()) );
              },
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.add,
              label: "Adicionar",
          ),])
      ),
    );
  }
}

