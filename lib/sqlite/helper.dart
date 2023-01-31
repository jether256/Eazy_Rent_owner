import 'dart:io';
import 'package:eazy_landlord/owner/ownermodels/housemodel.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../owner/ownermodels/business.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'house.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE House('
              'ID INTEGER PRIMARY KEY,'
              'user_id TEXT,'
              'owner TEXT,'
              'phone TEXT,'
              'bizname TEXT'
              'num TEXT'
              'mail TEXT'
              'image1 TEXT'
              'image2 TEXT'
              'image3 TEXT'
              'image4 TEXT'
              'image5 TEXT'
              'title TEXT'
              'price TEXT'
              'descc TEXT'
              'adu TEXT'
              'lat TEXT'
              'lon TEXT'
              'place TEXT'
              'bed TEXT'
              'bath TEXT'
              'fun TEXT'
              'con TEXT'
              'b TEXT'
              'c TEXT'
              'fl TEXT'
              'kit TEXT'
              'paid TEXT'
              'start TEXT'
              'end TEXT'
              'blo TEXT'
              'type TEXT'
              'proi TEXT'
              ')');
        });
  }

  // Insert employee on database
  createBusiness(HouseModel houseModel) async {
    await deleteAllHouses();
    final db = await database;
    final res = await db!.insert('House', houseModel.toJson());

    return res;
  }

  // Delete all employees
  Future<int> deleteAllHouses() async {
    final db = await database;
    final res = await db!.rawDelete('DELETE FROM House');

    return res;
  }

  Future<List<HouseModel>> showHouse() async {
    final db = await database;
    final res = await db!.rawQuery("SELECT * FROM House");

    List<HouseModel> list =
    res.isNotEmpty ? res.map((c) => HouseModel.fromJson(c)).toList() : [];

    return list;
  }
}