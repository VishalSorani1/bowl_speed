import 'dart:async';
import 'dart:developer';
import 'package:bowl_speed/services/models/manual_calc_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  static const textType = 'TEXT NOT NULL';
  static const doubleType = 'REAL NOT NULL';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB(TablesName.dbName);
    return _database!;
  }

  /// Method For initilizing Database
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1);
  }

  /// Method for checking if table exists
  Future<bool> _checkTableExists(String tableName) async {
    final db = await instance.database;
    var tableExistsResult = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name='$tableName'");
    return tableExistsResult.isEmpty;
  }

  /// Method creating Table
  Future<void> _createTableIfNotExists(
      String tableName, String createTableQuery) async {
    final db = await instance.database;

    // Check if the table is not exists
    if (await _checkTableExists(tableName)) {
      await db.execute(createTableQuery);
    }
  }

  /// insert data to database
  Future<int> _insert(
      String table, Map<String, dynamic> data, String createTableQuery) async {
    await _createTableIfNotExists(table, createTableQuery);

    final db = await instance.database;

    return await db.insert(
      table,
      data,
    );
  }

  /// Read Data from Db
  Future<List<T>> _readAll<T>(
    String table,
    String orderBy,
    T Function(Map<String, dynamic>) fromMap,
  ) async {
    final db = await instance.database;
    if (await _checkTableExists(table)) return [];
    
    final result = await db.query(table, orderBy: orderBy);
    return result.map((json) => fromMap(json)).toList();
  }

  /// insert method for manual Calculator
  Future<void> insertManualCalculator(ManualCalcModel model) async {
    const createTableQuery = '''
     CREATE TABLE ${TablesName.manualCalculator} (
      distance $doubleType,
      time $doubleType,
      kmh $doubleType,
      mph $doubleType,
      measurementType $textType,
      date $textType
      )
    ''';
    var result = await _insert(
        TablesName.manualCalculator, model.toMap(), createTableQuery);
    log("Manual Calculator inserted status : $result");
  }

  /// Read Data from Db for manual Calculator
  Future<List<ManualCalcModel>> readAllManualCalcs() async {
    return await _readAll(TablesName.manualCalculator, 'date ASC',
        (json) => ManualCalcModel.fromMap(json));
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

class TablesName {
  static const String dbName = 'bowl_speed.db';
  static const String manualCalculator = 'manualcalculator';
  static const String unitConverter = 'unitconverter';
}
