

import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:qr_scanner/models/scan_model.dart';

class DBProvider {

  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  get database async {
    if ( _database != null ) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database?> initDB() async {

    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'ScansDB.db' );
    // ignore: avoid_print
    print( path );

    // Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: ( Database db, int version) async {

        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');

      }
    );

  }

  nuevoScanRaw( ScanModel nuevoScan ) async {

    final id    = nuevoScan.autor;
    final tipo  = nuevoScan.tipo;
    final valor = nuevoScan.valor;
    // Verificar la base de datos
    final db = _database;

    final res = await db?.rawInsert('''
      INSERT INTO Scans( id, tipo, valor )
        VALUES( $id, '$tipo', '$valor' )
    ''');

    return res;
  }

  Future<int?> nuevoScan( ScanModel nuevoScan ) async {

    final db = _database;
    final res = await db?.insert('Scans', nuevoScan.toJson());
     // Es el ID
     // ignore: avoid_print
     print(res);
    return res;
  }



}


