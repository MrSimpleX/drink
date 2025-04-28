import 'package:drink/core/db/model/base_model.dart';

///
/// 用户数据
///
class User extends BaseModel {
  int? id;
  String name;
  String email;
  //关键点 此处id新增必须不传 否则数据库自增无效
  User({this.id, required this.name, required this.email});

  // 将 Map 转换为 User 对象
  factory User.fromMap(Map<String, dynamic> map) =>
      User(id: map['id'], name: map['name'], email: map['email']);

  // 将 User 对象转换为 Map
  @override
  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'email': email};
}
