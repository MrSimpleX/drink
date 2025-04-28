import 'package:drink/presentation/splash/splash_provider.dart';
import 'package:drink/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

///
/// 启动页
///
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    //触发初始化逻辑
    //ref.read(splashProvider.notifier)
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(splashProvider);

    // 监听状态变化
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state && mounted) {
        context.go(RoutePath.home); // 执行跳转
      }
    });

    return Scaffold(body: Center(child: const CircularProgressIndicator()));
  }
}
