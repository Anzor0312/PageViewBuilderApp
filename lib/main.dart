import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:pageview/core/theme/light_theme.dart';
import 'package:pageview/view/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp( MyApp(themeMode: savedThemeMode ,));
}

class MyApp extends StatelessWidget {
 final AdaptiveThemeMode? themeMode;
const   MyApp({super.key,required this.themeMode});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        dark: TestTheme.darkMode,
        light: TestTheme.lightMode,
        initial:themeMode?? AdaptiveThemeMode.light,
        builder: (theme, darkThem) {
          return MaterialApp(
            darkTheme: darkThem,
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: const HomePage(),
          );
        });
  }
}
