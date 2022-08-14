import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//external
import 'package:task_helper/app/models/tasks_model.dart';


final String  table_name= 'tasks';
final String  table_name_items= 'tasks_items';



class Db_view{
  static final Db_view _instance =  Db_view.internal();// não precisa entender
  factory Db_view() => _instance;// não precisa entender
  Db_view.internal();// não precisa entender

  Database? _db;

  Future<Database>get db async{
    if(_db != null){
      return _db!;
    }else{
      _db = await initDb();
      return _db!;
    }
  }

  Future<Database> initDb() async{// inicializa o banco de dados
    final databasePath = await  getDatabasesPath();// pega o caminho onde está feito
    final path = join(databasePath,'task_app.db');

    return openDatabase(
      path, version:1,
      onCreate: (Database db, int version) async{
        await db.execute(
           """
            DROP TABLE IF EXISTS $table_name;
            CREATE TABLE $table_name(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT NOT NULL ,
              date_creation TEXT NOT NULL,
              complete INTEGER DEFAULT 0);

            DROP TABLE IF EXISTS $table_name_items;
            CREATE TABLE $table_name_items(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL,
              date_creation TEXT NOT NULL,
              date_completed TEXT NOT NULL,
              complete INTEGER DEFAULT 0,
              id_task_item INTEGER NOT NULL,
              FOREIGN KEY (id_task_item) REFERENCES task(id) ON DELETE CASCADE
              );
              
           """
        );
      } );
  }

  Future<Tasks> insert_task(Tasks todo) async{
    Database dbTodo = await db;
    todo.id = await dbTodo.insert(table_name, todo.toMap());
    return todo; 
  }
  Future<Tasks> insert_items(Tasks todo) async{
    Database dbTodo = await db;
    todo.id = await dbTodo.insert(table_name_items, todo.toMap());
    return todo; 
  }


  // Future<Tasks> getTodo(int id) async{
  //   Database dbTodo = await db;
  //   List<Map> maps = await dbTodo.query(table_name,
  //     columns: ['id','tarefa','data']);
  // }


  Future<int> delete_task(int id) async{// o delete retorna um numero inteiro
    Database dbTodo = await db;
    return await dbTodo.delete(table_name, where: 'id = ?', whereArgs:[id]);
  }
  Future<int> delete_items(int id) async{// o delete retorna um numero inteiro
    Database dbTodo = await db;
    return await dbTodo.delete(table_name_items, where: 'id = ?', whereArgs:[id]);
  }
  
  Future<int> update_tasks(Tasks todo) async{// o delete retorna um numero inteiro
    Database dbTodo = await db;
    return await dbTodo.update(table_name, todo.toMap(), where: 'id = ?', whereArgs: [todo.id]);
  }
  Future<int> update_items(Tasks todo) async{// o delete retorna um numero inteiro
    Database dbTodo = await db;
    return await dbTodo.update(table_name_items, todo.toMap(), where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<List> get_all_tasks()async{
    Database dbTodo = await db;
    List listMap = await dbTodo.rawQuery("SELECT * FROM $table_name;");// pega todas as tables
    List<Tasks>  listTodo = [];
    for(Map m in listMap){
      listTodo.add(Tasks.fromMap(m));
    }
    return listTodo;
  }
  Future<List> get_all_items()async{
    Database dbTodo = await db;
    List listMap = await dbTodo.rawQuery("SELECT * FROM $table_name_items;");// pega todas as tables
    List<Tasks>  listTodo = [];
    for(Map m in listMap){
      listTodo.add(Tasks.fromMap(m));
    }
    return listTodo;
  }

  Future<int?> get_size_tasks() async{
    Database dbTodo =await db;
    return Sqflite.firstIntValue(await dbTodo.rawQuery("SELECT COUNT(*) FROM $table_name"));
  }
  Future<int?> get_size_items() async{
    Database dbTodo =await db;
    return Sqflite.firstIntValue(await dbTodo.rawQuery("SELECT COUNT(*) FROM $table_name_items"));
  }

   Future<int> delete_all_tasks() async{
    Database dbTodo = await db;
    return dbTodo.rawDelete('DELETE FROM $table_name');
  }
   Future<int> delete_all_items() async{
    Database dbTodo = await db;
    return dbTodo.rawDelete('DELETE FROM $table_name_items');
  }

  Future fechardb() async{
    Database dbTodo = await db;
    dbTodo.close();
  }

 

}