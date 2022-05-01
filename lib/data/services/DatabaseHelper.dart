import 'package:restaurant_app/data/model/SearchLocalRestaurant.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  static String _tableName = 'restaurant';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'restaurant.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName (
                id TEXT PRIMARY KEY,
                name TEXT, description TEXT,
                pictureId TEXT, city TEXT,
                rating DOUBLE PRECISION
            )''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> favoriteRestaurant(Restaurant restaurant) async {
    // try {
    // print(restaurant);
    final Database db = await database;
    await db.insert(_tableName, restaurant.toMap());
    // } catch (e) {
    //   print(e);
    // }
  }

  Future<List<Restaurant>> getFavorite() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    // print('hasil sqlite');
    // print(results);
    return results.map((res) => Restaurant.fromJson(res)).toList();
  }

  Future<Restaurant> getFavoriteById(String id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.map((res) => Restaurant.fromJson(res)).first;
  }

  Future<void> unfavoriteRestaurant(String id) async {
    // try {
    print('unfavorite');
    print(id);
    final db = await database;

    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    // } catch (e) {
    //   print(e);
    // }
  }
}
