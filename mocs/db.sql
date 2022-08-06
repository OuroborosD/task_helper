//TODO depois adicionar um campo de data de modificação, para saver se consigo fazer isso num app com dados
DROP TABLE IF EXISTS task;
CREATE TABLE task(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	title TEXT NOT NULL ,
	date_creation TEXT NOT NULL,
	complete INTEGER DEFAULT 0);

DROP TABLE IF EXISTS item;
CREATE TABLE item(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	date_creation TEXT NOT NULL,
	date_completed TEXT NOT NULL,
	complete INTEGER DEFAULT 0,
	id_task_item INTEGER NOT NULL,
	FOREIGN KEY (id_task_item) REFERENCES task(id) ON DELETE CASCADE
	);
	
	