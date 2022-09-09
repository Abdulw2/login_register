//well insert our logic here
import 'package:login_register/model/person.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Dbhandler {

late String path ;
// well initalze the code later* with  "late"

  Future<Database> _initDB() async {
  
path = join (await getDatabasesPath(), "registration.db");
  return await openDatabase(path, version: 1, onCreate: _createDB);
  //were are telling the engine to create the database for us.
}
Future _createDB(Database db,int version) async{
  await db.execute("CREATE TABLE users(name TEXT, password TEXT)");
}
//we're creating the database method 
//async checks the progress of the data. (async= synchronization of data)
//await waits on the progress on the data.
//future is the "hope"

Future <int> register (Person p) async { 
  final db = await _initDB(); 
  return await db.insert("users",{"name" : p.name, 'password' : p.password } );
  //db.insert returns an integer 
} 
// we're creatin' an instance of "persons"
}
//research Map and lists.