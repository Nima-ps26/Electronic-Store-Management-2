import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
class SQLHelperS{
  static Future<void>  createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE data( 
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      business1 TEXT,
      gst1 TEXT,
      authname1 TEXT,
     


      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

    )""");
  }
  static Future<sql.Database> db() async {
    return sql.openDatabase("database_name.db",version: 1,
      onCreate: (sql.Database database, int version) async{
        await createTables(database);
      }
      
    );
  }
  static Future<int> createData(String business1, String? gst1, String? authname1) async{
    final db =  await SQLHelperS.db();

    final data = {'business1':business1, 'gst1': gst1,'authname1':authname1};
    final id = await db.insert('data', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
 
  }
  static Future<List<Map<String, dynamic>>> getData() async{
    final db = await SQLHelperS.db();
    return db.query('data', orderBy: 'id');
  }
  static Future<List<Map<String, dynamic>>> getSingleData(int id) async {
    final db = await SQLHelperS.db();
    return db.query('data', where: "id = ?",whereArgs: [id], limit:1);
  }
  static Future<int> updateData(int id, String business1, String? gst1, String? authname1) async{
    final db = await SQLHelperS.db();
    final data = {
      'business1': business1,
      'gst1': gst1,
      'authname1':authname1,
      'createdAt': DateTime.now().toString()
    };
    final result = 
    await db.update('data', data,where :"id=?", whereArgs: [id]);
    return result;
  }
  static Future<void> deleteData(int id) async{
    final db = await SQLHelperS.db();
    try {
      await db.delete('data', where: "id=?", whereArgs: [id]);
    } catch(e){}
}
}