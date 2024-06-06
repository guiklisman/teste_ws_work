import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/lead.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  static Database? _database;

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'leads.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE leads(id INTEGER PRIMARY KEY, carId INTEGER, userName TEXT, userContact TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertLead(Lead lead) async {
    final db = await database;
    await db.insert('leads', lead.toJson());
  }

  Future<List<Lead>> getLeads() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('leads');
    return List.generate(maps.length, (i) {
      return Lead(
        carId: maps[i]['carId'],
        userName: maps[i]['userName'],
        userContact: maps[i]['userContact'],
      );
    });
  }
}
