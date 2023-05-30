import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DB {
  //construtor com acesso privado
  DB._();
  //criar uma instancia de DB
  static final DB instance = DB._();
  //instancia do SQLite
  static Database? _database;

  get database async {
    if (_database != null) {
      return _database;
    } else {
      return await _initDataBase();
    }
  }

  _initDataBase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'localData.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_perfil);
    await db.execute(_condominio);
    await db.execute(_convites);
    await db.execute(_contatos);
  }

  String get _perfil => '''
    CREATE TABLE perfil(
      nome TEXT,
      sobrenome TEXT,
      tipo TEXT,
      unidade TEXT,
      email TEXT,
      data_nascimento TEXT
    );
  ''';

  String get _convites => '''
    CREATE TABLE convites(
      nome TEXT,
      cnpj TEXT,
      telefone TEXT,
      endereco TEXT,
      descricao TEXT,
      latitude TEXT,
      longetude TEXT,
    );
  ''';

  String get _contatos => '''
    CREATE TABLE condominio(
      nome TEXT,
      cnpj TEXT,
      telefone TEXT,
      endereco TEXT,
      descricao TEXT,
      latitude TEXT,
      longetude TEXT,
    );
  ''';

  String get _condominio => '''
    CREATE TABLE condominio(
      nome TEXT,
      cnpj TEXT,
      telefone TEXT,
      endereco TEXT,
      descricao TEXT,
      latitude TEXT,
      longetude TEXT,
    );
  ''';

}
