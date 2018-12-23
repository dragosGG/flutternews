import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../models/item_model.dart';

class NewsDbProvider {
  Database db;



  init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "items.pub");
    db = await openDatabase(
      path,
      version: 1, 
      onCreate: (Database newDb, int version) {
        newDb.execute("""
         CREATE TABLE Items
         (
           id INTEGER PRIMARU KEY,
           type TEXT,
           by TEXT, 
           time INTEGER, 
           text TEXT, 
           partent INTEGER,
           kids BLOB,
           dead INTEGER, 0 === false, 1 === true,
           deleted INTEGER,
           url TEXT,
           title TEXT, 
           descendants INTEGER
         )
         """

        );
      }
    );

   Future<ItemModel> fetchItem(int id) async{
       final maps = await db.query(
        "Items",
        columns: null,
        where: "id => ",
        whereArgs: [id],
              );

      if (maps.length > 0) {
        return ItemModel.fromDB(maps.first);

      }
      return null; 
    }  
    

    Future<int> addItem(ItemModel item) {
      return db.insert("Items", item.toMap());
      
    }
  }
}