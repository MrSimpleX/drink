import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// 处理异步操作
///
class SplashProvider extends StateNotifier<bool> {
  final Ref ref;

  SplashProvider(this.ref) : super(false) {
    _initApp();
  }

  Future<void> _initApp() async {
    //延迟
    await Future.delayed(const Duration(seconds: 1));

    state = true;
  }
}

//提供splash提供器
final splashProvider = StateNotifierProvider<SplashProvider, bool>(
  (ref) => SplashProvider(ref),
);
