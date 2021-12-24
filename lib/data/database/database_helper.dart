// import 'package:cookmate/data/model/search_recipe.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   static DatabaseHelper? _instance;
//   static Database? _database;

//   DatabaseHelper._internal() {
//     _instance = this;
//   }

//   factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

//   static const String _tblFavorite = 'favorite';

//   Future<Database> _initializeDb() async {
//     var path = await getDatabasesPath();
//     var db = openDatabase(
//       '$path/result.db',
//       onCreate: (db, version) async {
//         await db.execute('''CREATE TABLE $_tblFavorite (
//              key TEXT PRIMARY KEY,
//              title TEXT,
//              thumb TEXT,
//              serving TEXT,
//              times TEXT,
//            )     
//         ''');
//       },
//       version: 1,
//     );

//     return db;
//   }

//   Future<Database?> get database async {
//     _database ??= await _initializeDb();

//     return _database;
//   }

//   Future<void> insertFav(Result result) async {
//     final db = await database;
//     await db!.insert(_tblFavorite, result.toJson());
//   }

//   Future<List<Result>> getFavs() async {
//     final db = await database;
//     List<Map<String, dynamic>> results = await db!.query(_tblFavorite);

//     return results.map((res) => Result.fromJson(res)).toList();
//   }

//   Future<Map> getFavbyId(String key) async {
//     final db = await database;

//     List<Map<String, dynamic>> results = await db!.query(
//       _tblFavorite,
//       where: 'key = ?',
//       whereArgs: [key],
//     );

//     if (results.isNotEmpty) {
//       return results.first;
//     } else {
//       return {};
//     }
//   }

//   Future<void> removeFav(String key) async {
//     final db = await database;

//     await db!.delete(
//       _tblFavorite,
//       where: 'key = ?',
//       whereArgs: [key],
//     );
//   }
// }
