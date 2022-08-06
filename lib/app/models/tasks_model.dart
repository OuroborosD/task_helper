class Tasks{
  Tasks({required this.title, required this.date_creation,this.complete = false});
  int? id;
  String? title;
  DateTime? date_creation;
  bool? complete; // saber se está completo
  
  Tasks.fromMap(Map map){// transformar o mapa em dados da classe
    id = map['id'];// vai pegar a row com os dados tranformar em mapa, e o map['colunma'] vai ser colocado aqui
    title = map['title'];
    date_creation = DateTime.parse(map['date_creation']);// tranforma a string em datetime
  }
  
  Map<String, dynamic> toMap(){// transforma o objeto em mapa
   Map<String, dynamic> map = {// não tem id, pois é o banco de dados que vai gerar
    'title': title, 
    'date_creation': date_creation.toString(), 
   };
   if( id != null){//
    map['id'] = id;
   }
   return map;

  }

  @override
 String toString(){// override, para mostrar otodos os dados de forma fácil
  return 'id: $id, title: $title, date: $date_creation';
 }

}



class Tasks_items{
  Tasks_items({required this.name, required this.date_creation,this.date_completed, this.id_task_item});
  int? id;
  String? name;
  DateTime? date_creation;
  DateTime? date_completed;
  bool? complete;
  int? id_task_item;
  Tasks_items.fromMap(Map map){// transformar o mapa em dados da classe
    id = map['id'];// vai transformar a string id no nome da columna
    name = map['name'];
    date_creation = DateTime.parse(map['date_creation']);// tranforma a string em datetime
    date_completed = DateTime.parse(map['date_completed']);
    id_task_item = map['id_task_item'];
    complete = map['complete'] == 0 ? false: true;// sqlite não tem bool, ele funciona 
                                                  //como 1(true) e 0(false) por isos precisa da conversão 
  }
  
  Map<String, dynamic> toMap(){// transforma o objeto em mapa
   Map<String, dynamic> map = {// não tem id, pois é o banco de dados que vai gerar
    'name': name, 
    'date_creation': date_creation.toString(), 
    'date_completed': date_completed.toString(),
    'id_task_item': id_task_item,
    'complete': complete == false? 0 : 1,//sqlite não tem bool
   };
   if( id != null){//
    map['id'] = id;
   }
   return map;

  }

  @override
 String toString(){// override, para mostrar otodos os dados de forma fácil
  return 'id: $id, name: $name, data: $date_creation status:$complete ';
 }

}