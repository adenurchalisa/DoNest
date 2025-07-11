import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/donation.dart';

class DatabaseHelper {
  // Nama database dan tabel
  static const String _databaseName = "donasi_app.db";
  static const String _tableName = "donations";
  
  // Singleton pattern
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();
  
  // Database instance
  static Database? _database;
  
  // Getter untuk database
  Future<Database> get database async {
    if (_database != null) return _database!;
    
    _database = await _initDatabase();
    return _database!;
  }
  
  // Inisialisasi database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }
  
  // Membuat tabel
  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        campaignTitle TEXT,
        amount INTEGER,
        date TEXT
      )
    ''');
  }
  
  // Menyimpan donasi
  Future<int> saveDonation(Donation donation) async {
    Database db = await database;
    return await db.insert(_tableName, donation.toMap());
  }
  
  // Mengambil semua donasi
  Future<List<Donation>> getAllDonations() async {
    Database db = await database;
    var maps = await db.query(_tableName, orderBy: 'id DESC');
    
    return List.generate(maps.length, (i) {
      return Donation.fromMap(maps[i]);
    });
  }
}
