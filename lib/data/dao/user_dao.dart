import 'package:drink/core/db/dao/base_dao.dart';
import 'package:drink/data/model/user.dart';

///
/// 用户数据操作
///
class UserDao extends BaseDao<User> {
  ///根据 Id 获取数据
  Future<User?> getUserById(int id) async {
    return getItem('id', id.toString());
  }

  @override
  User fromMap(Map<String, dynamic> map) => User.fromMap(map);

  @override
  String get tableName => 'users';

  @override
  Map<String, dynamic> toMap(User item) => item.toMap();
}
