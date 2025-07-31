/*import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> _getDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'expenses.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE expenses(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, amount REAL, month TEXT)',
        );
      },
      version: 1,
    );
  }

  // Funkcija za spremanje troška u bazu
  static Future<void> insertExpense(
      String name, double amount, String month) async {
    final db = await _getDatabase();
    await db.insert(
      'expenses',
      {'name': name, 'amount': amount, 'month': month},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Dohvati sve troškove iz baze
  static Future<List<Map<String, dynamic>>> getExpenses() async {
    final db = await _getDatabase();
    return await db.query('expenses');
  }

  // Dohvati troškove za određeni mjesec
  static Future<List<Map<String, dynamic>>> getExpensesByMonth(
      String month) async {
    final db = await _getDatabase();
    return await db.query('expenses', where: 'month = ?', whereArgs: [month]);
  }

  // Dohvati ukupan iznos troškova za određeni mjesec
  static Future<double> getTotalExpenseForMonth(String month) async {
    final db = await _getDatabase();
    var result = await db.rawQuery(
        "SELECT SUM(amount) as total FROM expenses WHERE month = ?", [month]);

    double total = (result.first['total'] as num?)?.toDouble() ?? 0.0;
    return total;
  }
}*/

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> _getDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'expenses.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE expenses(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, amount REAL, month TEXT)',
        );
      },
      version: 1,
    );
  }

  // Funkcija za spremanje troška u bazu
  static Future<void> insertExpense(
      String name, double amount, String month) async {
    final db = await _getDatabase();
    await db.insert(
      'expenses',
      {'name': name, 'amount': amount, 'month': month},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Dohvati sve troškove iz baze
  static Future<List<Map<String, dynamic>>> getExpenses() async {
    final db = await _getDatabase();
    return await db.query('expenses');
  }

  // Dohvati troškove za određeni mjesec
  static Future<List<Map<String, dynamic>>> getExpensesByMonth(
      String month) async {
    final db = await _getDatabase();
    return await db.query('expenses', where: 'month = ?', whereArgs: [month]);
  }

  // Dohvati ukupan iznos troškova za određeni mjesec
  static Future<double> getTotalExpenseForMonth(String month) async {
    final db = await _getDatabase();
    var result = await db.rawQuery(
        "SELECT SUM(amount) as total FROM expenses WHERE month = ?", [month]);

    double total = (result.first['total'] as num?)?.toDouble() ?? 0.0;
    return total;
  }

  // Funkcija za brisanje troška iz baze
  static Future<void> deleteExpense(int id) async {
    final db = await _getDatabase();
    await db.delete(
      'expenses',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
