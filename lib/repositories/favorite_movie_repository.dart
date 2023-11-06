import '../database/app_database.dart';

class FavoriteMovieRepository{

  //obtener todos los id de los elementos de la tabla de favoritos
  Future<List<int>> getAll() async{
    final db= await AppDatabase().openDb();
    final List maps= await db.query(AppDatabase().tableName);
    final ids=maps.map((e) => e['id'] as int).toList();
    return ids;
  }

  //para saber si lo que me dan como parametro pertenece o no a la tabla de favoritos
  Future<bool> isFavorite(int id) async{
    final db= await AppDatabase().openDb();

    final List maps= await db.query(AppDatabase().tableName,
        where: 'id=?', whereArgs: [id]);
    //maps esta lleno es true, por eso el "isNotEmpty"
    return maps.isNotEmpty; //devuelve si cierta entidad es o no favorita(se guardo o no en el database)
  }

  //insertar por id
  insert(int id) async{
    final db= await AppDatabase().openDb();
    await db.insert(AppDatabase().tableName, {'id':id});
  }

  //eliminar por id
  Future delete(int id) async{
    final db= await AppDatabase().openDb();
    db.delete(AppDatabase().tableName,
        where: "id=?", whereArgs:[id]);
  }

}
