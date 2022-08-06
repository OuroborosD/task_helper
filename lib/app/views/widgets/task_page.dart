import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
// extern
import 'package:flutter_slidable/flutter_slidable.dart';

class CardTaskHome extends StatelessWidget {
  const CardTaskHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('hello ');
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
                      'titulo: asdsad',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'criada em: 12/08/2022',
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
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  icon: Icons.add,
                  label: "Adicionar",
                ),
              ]))),
    );
  }
}
