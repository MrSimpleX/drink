import 'dart:math';

import 'package:drink/data/dao/user_dao.dart';
import 'package:drink/data/model/user.dart';
import 'package:flutter/material.dart';

///
/// 数据库操作测试页
///
class DBPage extends StatefulWidget {
  const DBPage({super.key});

  @override
  State<StatefulWidget> createState() => _DBPageState();
}

class _DBPageState extends State<DBPage> {
  final UserDao _userDao = UserDao();
  List<User> _users = [];
  bool _isLoading = true;

  //加载所有用户数据
  Future<void> _loadUsers() async {
    setState(() => _isLoading = true);
    _users = await _userDao.getAll();
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    //_addUser();
    _loadUsers();
  }

  //构建用户列表项
  Widget _buildUserItem(User user) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: () => _addUser(), icon: Icon(Icons.edit)),
          IconButton(
            onPressed: () => _deleteUser(user),
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('用户列表'),
          actions: [
            IconButton(onPressed: _loadUsers, icon: const Icon(Icons.refresh)),
          ],
        ),
        body:
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                  itemBuilder:
                      (context, index) => _buildUserItem(_users[index]),
                  itemCount: _users.length,
                ),
      ),
    );
  }

  ///删除用户
  Future<void> _deleteUser(User user) async {
    await _userDao.delete(user);
    _loadUsers();
  }

  ///添加用户
  Future<void> _addUser() async {
    final random = Random();
    int randomInt = random.nextInt(100);
    await _userDao.insert(
      User(name: '测试$randomInt', email: '$randomInt @sovell.com'),
    );
    _loadUsers();
  }
}
