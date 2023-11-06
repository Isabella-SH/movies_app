import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase{

  final int version=1;
  final String databaseName='movies.db';
  final String tableName= 'favorite_movies';

  Database? _db;

  //funcion patra la creacion de nuetsra base de datos
  Future<Database> openDb()async{
    //abrir el directorio donde estan las databases y lo uno con el nombre de nuestra base se datos
    _db = await openDatabase(join(await getDatabasesPath(), databaseName),
        onCreate: (database, version){
          String query= 'create table $tableName (id integer primary key)';
          log(query);
          database.execute(query);
        }, version: version
    );
    return _db as Database;
  }
}

