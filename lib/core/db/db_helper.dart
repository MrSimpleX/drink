import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  //创建单例模式
  factory DBHelper() => _instance;
  static final DBHelper _instance = DBHelper._internal();
  static Database? _database;

  //初始化私有构造函数
  DBHelper._internal();

  //获取数据库实例
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  //初始化数据库
  Future<Database> _initDatabase() async {
    //获取应用文档目录
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = join(dir.path, 'drink', 'drink.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        //创建表
        await db.execute('''
              CREATE TABLE users(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT,
                email TEXT
              )
              ''');
      },
      onUpgrade: (db, oldVersion, newVersion) {},
    );
  }
}
