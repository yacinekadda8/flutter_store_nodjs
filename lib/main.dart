import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/common/widgets/bottom_bar.dart';
import 'package:flutter_store_nodjs/controllers/user_provider.dart';
import 'package:flutter_store_nodjs/features/auth/services/auth_service.dart';
import 'package:flutter_store_nodjs/features/home/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'components/constans.dart';
import 'router.dart';
import 'features/auth/screens/auth_screen.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);

  }

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
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? const BottomBar()
            : const AuthScreen());
  }
}
