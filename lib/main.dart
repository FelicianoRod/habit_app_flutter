import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habits_app/router/app_router.dart';
import 'package:habits_app/theme/app_theme.dart';
// Develop
// import 'package:habits_app/data/service/objectbox.dart';
// import 'package:habits_app/objectbox.g.dart';

// Develop
// ObjectBox? objectBox;
// late final Admin? admin;

void main() async {
  // Develop
  // objectBox = await ObjectBox.create();
  // if (objectBox != null) {
  //   admin = Admin(objectBox!.store);
  // }

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
