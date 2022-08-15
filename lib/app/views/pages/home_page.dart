import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task_helper/app/controller/title_controller.dart';
import 'package:task_helper/app/views/widgets/card_add_home.dart';
import 'package:task_helper/app/views/widgets/card_title_home.dart';

import '../../models/tasks_model.dart';
// resizeToAvoidBottomInset: false,

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TitleAux t1 = TitleAux();

//     @override
//   void initState() async{// serve para quando iniciar o app carregar o banco
//     super.initState();
//     await t1.gettitle();
// }

  testefor() {
    for (Tasks title in t1.lista_title) {
      CardTaskHome(task: title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  await t1.gettitle();
                  testefor();
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        backgroundColor: Colors.blue,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(children: [
            Flexible(flex: 2, child: CardAddTitle()),
            //FIXME para carregar na nova lista toda vez que voltar para a pagina
            FutureBuilder<List>(
              // o tipo, é do tipo de retorno da função que tem como parame-tro
              future: t1
                  .gettitle(), // get_finance return a Map, então future-Buildr é um map
              builder: (context, snapshot) {
                // snapshot, é uma copia da tela
                switch (snapshot.connectionState) {
                  // verifica se está fluindo o codico, ou ele está parado aguardando a função async
                  case ConnectionState.none: // verifica se não tem nada
                  case ConnectionState
                      .waiting: // verifica se está esperando uma função async
                    return Center(
                      // case esteja esperando entre nessa parte, e carrega o icone de carretgando
                      child: Icon(Icons.refresh),
                    );
                  default:
                    if (snapshot.hasError) {
                      // case de algum erro ao carregar a
                      return Center(
                        child: Icon(Icons.error),
                      );
                    } else {
                      return Flexible(
                          flex: 8,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              for (Tasks title in t1.lista_title)
                                CardTaskHome(task: title)
                            ],
                          ));
                    }
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
