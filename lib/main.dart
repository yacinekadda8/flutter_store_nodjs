import 'package:ecommerce_app_with_nodejs/components/constans.dart';
import 'package:ecommerce_app_with_nodejs/screens/auth_screen.dart';
import 'package:flutter/material.dart';

import 'router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sellit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: GlobalVars.background,
            colorScheme: const ColorScheme.light(
              primary: GlobalVars.secondaryAccent,
            ),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
                elevation: 0.0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ))),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const AuthScreen()
        );
  }
}
