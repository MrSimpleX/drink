import 'package:sqflite/sqflite.dart';

import '../db_helper.dart';
import '../model/base_model.dart';

///
/// 泛型基类 DAO
///
abstract class BaseDao<T extends BaseModel> {
  final DBHelper dbHelper = DBHelper();

  // 操作数据库表名
  String get tableName;

  // Map 转化为
  T fromMap(Map<String, dynamic> map);

  // 对象转化为 Map
  Map<String, dynamic> toMap(T item);

  //获取数据库实例
  Future<Database> get _db async => await dbHelper.database;

  /// 新增数据
  Future<int> insert(T item) async {
    final db = await _db;
    return await db.insert(tableName, toMap(item)..remove('id'));
  }

  ///删除数据
  Future<int> delete(T item) async {
    final db = await _db;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [item.id]);
  }

  ///更新数据
  Future<int> update(T item) async {
    final db = await _db;
    return await db.update(
      tableName,
      toMap(item),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  ///查询所有数据
  Future<List<T>> getAll() async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return maps.map((map) => fromMap(map)).toList();
  }

  ///
  /// 查询条件 [whereArgs] 对应处 [where] 数据
  ///
  Future<T?> getItem(String where, String whereArgs) async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: '$where = ?',
      whereArgs: [whereArgs],
    );
    return maps.isNotEmpty ? fromMap(maps.first) : null;
  }
}
