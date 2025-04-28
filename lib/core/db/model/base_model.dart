///
/// 数据库 model
///
abstract class BaseModel {
  //自增 ID
  int? id;

  Map<String, dynamic> toMap();
}
