import 'package:freelancehub/core/config/supabase_client_config.dart';
import 'package:freelancehub/core/router/app_router.dart';
import 'package:freelancehub/core/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: SupabaseClientConfig.supabaseUrl,
    publishableKey: SupabaseClientConfig.publishableKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: AppTheme.defaultThemeMode,
      routerConfig: appRouter,
    );
  }
}
