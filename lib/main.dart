import 'dart:io';

import 'package:drink/presentation/splash/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'routes/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initDB();
  runApp(const ProviderScope(child: App()));
}

Future<void> _initDB() async {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
}

class App extends ConsumerStatefulWidget {
  const App({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp.router(routerConfig: appRouter);
  // }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
