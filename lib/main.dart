import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bookapp_flutter/data/local/shared_preferences.dart';
import 'package:bookapp_flutter/ui/pages/dashboard/dashboard_page.dart';
import 'package:bookapp_flutter/ui/pages/home/home_page.dart';
import 'package:bookapp_flutter/ui/pages/login/login_page.dart';
import 'package:bookapp_flutter/ui/pages/register/register_page.dart';
import 'package:bookapp_flutter/ui/pages/splash/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MyPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: ThemeData.light(useMaterial3: true),
        dark: ThemeData.dark(useMaterial3: true),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Adaptive Theme Demo',
              theme: theme,
              darkTheme: darkTheme,
              initialRoute: "/",
              routes: {
                "/": (context) => const SplashPage(),
                "register": (context) => RegisterPage(),
                "login": (context) => LoginPage(),
                "home": (context) => const HomePage(),
                "dashboard": (context) => const DashboardPage(),
              },
            ));
  }
}
