import 'package:drink/presentation/home/page/db_page.dart';
import 'package:drink/presentation/splash/splash_page.dart';
import 'package:drink/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///
/// 全局路由配置
///
final appRouter = GoRouter(
  initialLocation: RoutePath.splash,
  debugLogDiagnostics: true,
  //redirect: (context,state)=>{return ''},
  routes: [
    //数据库测试页
    GoRoute(
      path: RoutePath.home,
      pageBuilder: (_, state) => const MaterialPage(child: DBPage()),
    ),
    //启动页
    GoRoute(
      path: RoutePath.splash,
      pageBuilder: (_, state) => const MaterialPage(child: SplashPage()),
    ),
  ],
);
