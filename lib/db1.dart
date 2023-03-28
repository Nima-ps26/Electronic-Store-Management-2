// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:flutter/material.dart';
// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper.internal();

//   factory DatabaseHelper() => _instance;

//   static Database _db;

//   Future<Database> get db async {
//     if (_db != null) {
//       return _db;
//     }
//     _db = await initDb();
//     return _db;
//   }

//   DatabaseHelper.internal();

//   Future<Database> initDb() async {
//     String databasesPath = await getDatabasesPath();
//     String path = join(databasesPath, 'myapp.db');
//     return await openDatabase(path, version: 1, onCreate: _onCreate);
//   }

//   void _onCreate(Database db, int newVersion) async {
//     await db.execute('''
//       CREATE TABLE Forms (
//         id INTEGER PRIMARY KEY,
//         name TEXT,
//         email TEXT,
//         phone TEXT
//       )
//     ''');
//   }

//   Future<int> saveForm(FormData formData) async {
//     var dbClient = await db;
//     return await dbClient.insert('Forms', formData.toMap());
//   }

//   Future<List<FormData>> getAllForms() async {
//     var dbClient = await db;
//     List<Map> maps = await dbClient.query('Forms', columns: ['id', 'name', 'email', 'phone']);
//     List<FormData> forms = [];
//     if (maps.length > 0) {
//       for (var map in maps) {
//         forms.add(FormData.fromMap(map));
//       }
//     }
//     return forms;
//   }
// }

// class FormData {
//   int id;
//   String name;
//   String email;
//   String phone;

//   FormData({this.id, this.name, this.email, this.phone});

//   Map<String, dynamic> toMap() {
//     var map = <String, dynamic>{
//       'name': name,
//       'email': email,
//       'phone': phone,
//     };
//     if (id != null) {
//       map['id'] = id;
//     }
//     return map;
//   }

//   FormData.fromMap(Map<String, dynamic> map) {
//     id = map['id'];
//     name = map['name'];
//     email = map['email'];
//     phone = map['phone'];
//   }
// }
