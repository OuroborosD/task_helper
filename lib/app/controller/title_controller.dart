import 'package:task_helper/app/models/tasks_model.dart';

import '../models/tasks_model.dart';

List<Tasks> lista_title = [];


class title {
  generate_title(String title) {
    Tasks t1 = Tasks(title: title, date_creation: DateTime.now());
    lista_title.add(t1);
    print(t1);
  }
}
