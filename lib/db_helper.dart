import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:esm/Purchase/purchase_modal.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'modal.dart';
import 'package:esm/supplier/sup_modal.dart';
import 'package:esm/item/item_modal.dart';
import 'inv/invoice_modal.dart';

class DatabaseHelper {
  static Future<void> createTables(sql.Database database) async {  


    // creating table
    await database.execute(""" 
      CREATE TABLE customers(
        custid INTEGER PRIMARY KEY AUTOINCREMENT,  
        businessname TEXT,
        gstnumber INTEGER,
        authperson TEXT,
        bcontact INTEGER,
        pcontact INTEGER,
        custemail TEXT
      )
    """);
//supplier table
        await database.execute(""" 
      CREATE TABLE suppliers(
        supid INTEGER PRIMARY KEY AUTOINCREMENT,  
        supplierid TEXT,
        businessname1 TEXT,
        gstnumber1 INTEGER,
        authperson1 TEXT,
        bcontact1 INTEGER,
        pcontact1 INTEGER,
        custemail1 TEXT
      )
    """);

    //item table
        await database.execute(""" 
      CREATE TABLE items(
        itemid INTEGER PRIMARY KEY AUTOINCREMENT,  
        itemname TEXT,
        hsncode INTEGER,
        itemspec TEXT,
        img TEXT,
        amount INTEGER,
        custemail1 TEXT,
        supplierid TEXT,
        FOREIGN KEY (supplierid) REFERENCES suppliers(supplierid)


      )
    """);

    //purchase table

     await database.execute(""" 
      CREATE TABLE purchases(
        purchaseid INTEGER PRIMARY KEY AUTOINCREMENT,  
        itemname TEXT,
        quantity INTEGER,
        amount INTEGER,
        FOREIGN KEY (itemname) REFERENCES items(itemname)


      )
    """);

    //purchase table

     await database.execute(""" 
      CREATE TABLE sales(
        saleid INTEGER PRIMARY KEY AUTOINCREMENT,  
        customername TEXT,
        total INTEGER,
        FOREIGN KEY (customername) REFERENCES customers(customername)


      )
    """);
    //invoice

    await database.execute(""" 
      CREATE TABLE invoices(
        invoiceid INTEGER PRIMARY KEY AUTOINCREMENT, 
        customername TEXT,
        name TEXT,
        email TEXT,
        id TEXT,
        business TEXT,
        business5 TEXT,
        itemname TEXT,
        quantity INTEGER,
        amount INTEGER,
        total INTEGER,

        FOREIGN KEY (customername) REFERENCES customers(customername),
        FOREIGN KEY (itemname) REFERENCES items(itemname)
    )  
    """);

    // next table add here.............




  }




  static Future<sql.Database> db() async {   // dont  touch ever...................
    // database creation ....
    return sql.openDatabase(
      'experimental.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  //.......................customer related  functions related to database...................

  static Future<int> addCustomer(Customer customer) async {
    // insert data to table
    final dbClient = await db();
    return dbClient.insert('customers', customer.toMap(),
        conflictAlgorithm:
            sql.ConflictAlgorithm.replace); // add conflictAlgorithm
  }

  static Future<List<Customer>> getCustomers() async {
    //fetching data to display details.....
    final dbClient = await db();
    final List<Map<String, dynamic>> maps = await dbClient.query('customers');

    return List.generate(maps.length, (i) {
      return Customer(
        custid: maps[i]['custid'],
        businessname: maps[i]['businessname'],
        gstnumber: maps[i]['gstnumber'],
        authperson: maps[i]['authperson'],
        bcontact: maps[i]['bcontact'],
        pcontact: maps[i]['pcontact'],
        custemail: maps[i]['custemail'],
      );
    });
  }

  static Future<Customer> getCustomer(int custid) async {
    //fetching data through id of table user
    final dbClient = await db();
    final maps =
        await dbClient.query('customers', where: 'custid = ?', whereArgs: [custid]);
    return Customer.fromMap(maps.first);
  }

  static Future<int> updateCustomer(int custid, Customer customer) async {
    final dbClient = await db();
    return dbClient.update(
      'customers',
      customer.toMap(),
      where: 'custid = ?',
      whereArgs: [custid],
    );
  }

  static Future<int> deleteCustomer(int custid) async {
    final dbClient = await db();
    return await dbClient.delete(
      'customers',
      where: 'custid = ?',
      whereArgs: [custid],
    );
  }



  //.......................end user.............................

  //start of supplier

 static Future<int> addSupplier(Supplier supplier) async {
    // insert data to table
    final dbClient = await db();
    return dbClient.insert('suppliers', supplier.toMap(),
        conflictAlgorithm:
            sql.ConflictAlgorithm.replace); // add conflictAlgorithm
  }

  static Future<List<Supplier>> getSuppliers() async {
    //fetching data to display details.....
    final dbClient = await db();
    final List<Map<String, dynamic>> maps = await dbClient.query('suppliers');

    return List.generate(maps.length, (i) {
      return Supplier(
        supid: maps[i]['supid'],
        supplierid: maps[i]['supplierid'],
        businessname1: maps[i]['businessname1'],
        gstnumber1: maps[i]['gstnumber1'],
        authperson1: maps[i]['authperson1'],
        bcontact1: maps[i]['bcontact1'],
        pcontact1: maps[i]['pcontact1'],
        custemail1: maps[i]['custemail1'],
      );
    });
  }

  static Future<Supplier> getSupplier(int supid) async {
    //fetching data through id of table user
    final dbClient = await db();
    final maps =
        await dbClient.query('suppliers', where: 'supid = ?', whereArgs: [supid]);
    return Supplier.fromMap(maps.first);
  }

  static Future<int> updateSupplier(int supid, Supplier supplier) async {
    final dbClient = await db();
    return dbClient.update(
      'suppliers',
      supplier.toMap(),
      where: 'supid = ?',
      whereArgs: [supid],
    );
  }

  static Future<int> deleteSupplier(int supid) async {
    final dbClient = await db();
    return await dbClient.delete(
      'suppliers',
      where: 'supid = ?',
      whereArgs: [supid],
    );
  }

  //start of items
  static Future<int> addItem(Item item) async {
    // insert data to table
    final dbClient = await db();
    return dbClient.insert('items', item.toMap(),
        conflictAlgorithm:
            sql.ConflictAlgorithm.replace); // add conflictAlgorithm
  }

  static Future<List<Item>> getItems() async {
    //fetching data to display details.....
    final dbClient = await db();
    final List<Map<String, dynamic>> maps = await dbClient.query('items');

    return List.generate(maps.length, (i) {
      return Item(
        itemid: maps[i]['itemid'],
        itemname: maps[i]['itemname'],
        hsncode: maps[i]['hsncode'],
        itemspec: maps[i]['itemspec'],
        img: maps[i]['img'],
        amount: maps[i]['amount'],
        supplierid: maps[i]['supplierid'],
      );
    });
  }

  static Future<Item> getItem(int itemid) async {
    //fetching data through id of table user
    final dbClient = await db();
    final maps =
        await dbClient.query('items', where: 'itemid = ?', whereArgs: [itemid]);
    return Item.fromMap(maps.first);
  }

  static Future<int> updateItem(int itemid, Item item) async {
    final dbClient = await db();
    return dbClient.update(
      'items',
      item.toMap(),
      where: 'itemid = ?',
      whereArgs: [itemid],
    );
  }

  static Future<int> deleteItem(int itemid) async {
    final dbClient = await db();
    return await dbClient.delete(
      'items',
      where: 'itemid = ?',
      whereArgs: [itemid],
    );
  }


//start of purchase


 static Future<int> addPurchase(Purchase purchase) async {
    // insert data to table
    final dbClient = await db();
    return dbClient.insert('purchases', purchase.toMap(),
        conflictAlgorithm:
            sql.ConflictAlgorithm.replace); // add conflictAlgorithm
  }

  static Future<List<Purchase>> getPurchases() async {
    //fetching data to display details.....
    final dbClient = await db();
    final List<Map<String, dynamic>> maps = await dbClient.query('purchases');

    return List.generate(maps.length, (i) {
      return Purchase(
        itemname: maps[i]['itemname'],
        quantity: maps[i]['quantity'],
        amount: maps[i]['amount'],
       
      );
    });
  }

  static Future<Purchase> getPurchase(int purchaseid) async {
    //fetching data through id of table user
    final dbClient = await db();
    final maps =
        await dbClient.query('purchases', where: 'purchaseid = ?', whereArgs: [purchaseid]);
    return Purchase.fromMap(maps.first);
  }

  static Future<int> updatePurchase(int purchaseid, Purchase purchase) async {
    final dbClient = await db();
    return dbClient.update(
      'purchases',
      purchase.toMap(),
      where: 'purchaseid = ?',
      whereArgs: [purchaseid],
    );
  }

  static Future<int> deletePurchase(int purchaseid) async {
    final dbClient = await db();
    return await dbClient.delete(
      'purchases',
      where: 'purchaseid = ?',
      whereArgs: [purchaseid],
    );
  }

  //start of invoice
static Future<int> addInvoice(Invoice invoice) async {
    // insert data to table
    final dbClient = await db();
    return dbClient.insert('invoices', invoice.toMap(),
        conflictAlgorithm:
            sql.ConflictAlgorithm.replace); // add conflictAlgorithm
  }

  static Future<List<Invoice>> getInvoices() async {
    //fetching data to display details.....
    final dbClient = await db();
    final List<Map<String, dynamic>> maps = await dbClient.query('invoices');

    return List.generate(maps.length, (i) {
      return Invoice(
        customername: maps[i]['customername'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        itemname: maps[i]['itemname'],
        id:maps[i]['id'],
        business: maps[i]['business'],
        business5: maps[i]['business5'],
        quantity: maps[i]['quantity'],
        amount: maps[i]['amount'],
       
      );
    });
  }

  static Future<Invoice> getInvoice(int invoiceid) async {
    //fetching data through id of table user
    final dbClient = await db();
    final maps =
        await dbClient.query('invoices', where: 'invoiceid = ?', whereArgs: [invoiceid]);
    return Invoice.fromMap(maps.first);
  }

  static Future<int> updateInvoice(int invoiceid, Invoice invoice) async {
    final dbClient = await db();
    return dbClient.update(
      'invoices',
      invoice.toMap(),
      where: 'invoiceid = ?',
      whereArgs: [invoiceid],
    );

    
  }
//  static Future<void> updateTotals() async {
//     final dbClient = await db();
//     await dbClient.rawUpdate('UPDATE invoices SET total = quantity*amount');
//   }

  static Future<int> deleteInvoice(int invoiceid) async {
    final dbClient = await db();
    return await dbClient.delete(
      'invoices',
      where: 'invoiceid = ?',
      whereArgs: [invoiceid],
    );

  
  }
  Future<void> updateEmptyColumn(int invoiceid, int quantity, int amount) async {
  // Open the database
  final dbClient = await sql.openDatabase('experimental.db');

  // Get the current value of the empty column
  final queryResult = await dbClient.rawQuery('SELECT total FROM invoices WHERE invoiceid = ?', [invoiceid]);
  final currentValue = queryResult.isNotEmpty ? queryResult.first['total'] as int: 0;

  // Calculate the new value of the empty column by adding column1 and column2
  final newValue = currentValue+quantity+amount;

  // Update the empty column with the new value
  await dbClient.rawUpdate('UPDATE invoices SET total = ? WHERE id = ?', [newValue, invoiceid]);


}

static Future<List<Map<String, dynamic>>> rawQuery(String query, List<String> list) async {
  final dbClient = await db();
  print(db());
  
  return dbClient.rawQuery(query,list);
}





}

