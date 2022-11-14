import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "cgg.db";
  static final _databaseVersion = 1;

  static final columnId = 'userId';
  static final tableName = 'Cricketers';
  // static final tableContact = 'contact';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();
  Future<Database?> get database1 async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database;
  }

  insertProduct() {}

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    print("document path ${documentsDirectory.path}");
    //saikrish/desktop/app/
    String path = join(documentsDirectory.path, _databaseName);
    //saikrish/desktop/app/cgg.db
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute(
        '''
          CREATE TABLE Cricketers
(
name varchar(255),
userId varchar(255) PRIMARY KEY,
role varchar(255),
gender varchar(255),
dob varchar(255),
userimage varchar(255),
country varchar(255)
);

          ''');

    // await db.execute(
    //     "CREATE TABLE user (username TEXT NOT NULL,phone TEXT NOT NULL,email TEXT NOT NULL)");
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(
    Map<String, dynamic> row,
  ) async {
    Database? db = await instance.database;
    return await db.insert(tableName, row);
  }

  Future<int> insertInto(Map<String, dynamic> row, String tableName) async {
    Database? db = await instance.database;
    return await db.insert(tableName, row);
  }

  Future<List> getAllRecords(String tableName) async {
    var dbClient = await instance.database;
    var result = await dbClient.rawQuery("SELECT * FROM Cricketers");

    return result.toList();
  }

  Future<int> delete(String id) async {
    Database db = await instance.database;
    return await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  deleteDataById(table, itemId) async {
    var connection = await database;
    return await connection
        .rawDelete("delete from $table where userId=$itemId");
  }
  // Future<int> insertContact(Map<String, dynamic> row) async {
  //   Database? db = await instance.database;
  //   return await db.insert(tableContact, row);
  // }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  /* Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(tableName);
  } */

  Future<List<Map<String, dynamic>>> queryAllRows(String s) async {
    Database db = await instance.database;
    var res = await db.query(tableName);
    return res;
  }
  // Future<List<Map<String, dynamic>>> queryAllRowsofContact() async {
  //   Database db = await instance.database;
  //   return await db.query(tableContact);
  // }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
            await db.rawQuery('SELECT COUNT(*) FROM $tableName')) ??
        0;
  }

  // // We are assuming here that the id column in the map is set. The other
  // // column values will be used to update the row.
  // Future<int> update(Map<String, dynamic> row) async {
  //   Database db = await instance.database;
  //   int id = row[columnId];
  //   return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  // }

  // // Deletes the row specified by the id. The number of affected rows is
  // // returned. This should be 1 as long as the row exists.
  // Future<int> delete(int id) async {
  //   Database db = await instance.database;
  //   return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  // }

  // Future<int> deleteContact(int id) async {
  //   Database db = await instance.database;
  //   return await db
  //       .delete(tableContact, where: '$columnId = ?', whereArgs: [id]);
  // }
  //CRUD
  //Creation
  //Read
  //Update
  //Delete

}

/*

//path 
//file - Db filename.db


 */