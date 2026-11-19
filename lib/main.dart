import 'package:freelancehub/core/config/supabase_client_config.dart';
import 'package:freelancehub/core/di/service_locator.dart';
import 'package:freelancehub/core/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: SupabaseClientConfig.supabaseUrl,
    publishableKey: SupabaseClientConfig.publishableKey,
  );
  configureDependencies();
  runApp(MyApp(router: getIt<GoRouter>()));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.router, super.key});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: AppTheme.defaultThemeMode,
      routerConfig: router,
    );
  }
}
