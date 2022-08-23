//well insert our logic here
import 'package:sqflite/sqflite.dart';


class Dbhandler {
  Future<Database> _initDB(String filePath) async {
  

  return await openDatabase(filePath, version: 1, onCreate: _createDB);
  //were are telling the engine to create the database for us.
}
Future _createDB(Database db,int version) async{
  await db.execute("CREATE TABLE users(name TEXT, password TEXT)");
}
//we're creating the database method 
//async checks the progress of the data. (async= synchronization of data)
//await waits on the progress on the data.
//future is the "hope"

}