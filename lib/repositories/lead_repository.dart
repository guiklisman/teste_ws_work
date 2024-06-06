import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/lead.dart';
import 'interfaces/lead_repository_interface.dart';

class LeadRepository implements ILeadRepository {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'leads.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE leads(id INTEGER PRIMARY KEY AUTOINCREMENT, carId INTEGER, userName TEXT, userContact TEXT)',
        );
      },
      version: 1,
    );
  }

  @override
  Future<void> addLead(Lead lead) async {
    final db = await database;
    await db.insert(
      'leads',
      lead.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Lead>> getLeads() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('leads');

    return List.generate(maps.length, (i) {
      return Lead.fromJson(maps[i]);
    });
  }
}
