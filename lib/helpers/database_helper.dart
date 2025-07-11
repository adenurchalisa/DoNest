import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/donation.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    
    _database = await _initDB('donations.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE donations(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        campaignTitle TEXT NOT NULL,
        amount INTEGER NOT NULL,
        date TEXT NOT NULL
      )
    ''');
  }

  // Save donation to database
  Future<int> saveDonation(Donation donation) async {
    final db = await instance.database;
    return await db.insert('donations', donation.toMap());
  }

  // Get all donations
  Future<List<Donation>> getDonations() async {
    final db = await instance.database;
    final result = await db.query('donations', orderBy: 'id DESC');
    
    return result.map((map) => Donation.fromMap(map)).toList();
  }

  // Get donation by id
  Future<Donation?> getDonation(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      'donations',
      where: 'id = ?',
      whereArgs: [id],
    );
    
    if (maps.isNotEmpty) {
      return Donation.fromMap(maps.first);
    }
    return null;
  }

  // Delete donation
  Future<int> deleteDonation(int id) async {
    final db = await instance.database;
    return await db.delete(
      'donations',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Close database
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
