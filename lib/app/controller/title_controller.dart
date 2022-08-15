import 'package:flutter/material.dart';

//external
import 'package:task_helper/app/models/tasks_model.dart';
import 'package:task_helper/helpers/db_helper.dart';
import '../models/tasks_model.dart';


class TitleAux {
  static final TitleAux _instance =  TitleAux.internal();// não precisa entender
  factory TitleAux() => _instance;// não precisa entender
  TitleAux.internal();// não precisa entender

  Db_helper aux_db = Db_helper();

  TextEditingController title_task = new TextEditingController();
  List<Tasks> lista_title = [];
  void generate_title(String title) async{
    Tasks t1 = Tasks(title: title, date_creation: DateTime.now());
    await aux_db.db_exist();
    await aux_db.insert_task(t1);// salva classe no db
    title_task.clear();
  }

  Future<List<Tasks>> gettitle() async{// como está retornando um future tem que colocar isso
    lista_title = await aux_db.get_all_tasks() as List<Tasks>;
    print(lista_title.runtimeType);
    print("lista_title");
    return lista_title;
  }
}
