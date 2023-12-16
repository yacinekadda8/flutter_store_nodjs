import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/home.dart';
import 'package:flutter_store_nodjs/features/account/providers/account_provider.dart';
import 'package:flutter_store_nodjs/features/admin/providers/products_provider.dart';
import 'package:flutter_store_nodjs/features/admin/screens/admin_screen.dart';
import 'package:flutter_store_nodjs/features/auth/providers/auth_provider.dart';
import 'package:flutter_store_nodjs/providers/user_provider.dart';
import 'package:flutter_store_nodjs/features/auth/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'components/myconstans.dart';
import 'router.dart';
import 'features/auth/screens/auth_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => AuthProvider()),
    ChangeNotifierProvider(create: (context) => AccountProvider()),
    ChangeNotifierProvider(create: (context) => ProductsProvider()),
  ], child: const MyApp()));
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
          scaffoldBackgroundColor: MyConstans.background,
          colorScheme: const ColorScheme.light(
            primary: MyConstans.lightBlueSecondary,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              elevation: 0.0,
              iconTheme: IconThemeData(
                color: Colors.black,
              ))),
      onGenerateRoute: (settings) => generateRoute(settings),
      // home: Provider.of<UserProvider>(context).user.token.isNotEmpty
      //     ? const AdminScreen()
      //     : const AuthScreen());
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const Home()
              : const AdminScreen()
          : const AuthScreen(),
    );
  }
}
/*
if(notEmpty == true){
    if(user.type == 'user) {
        return const BottomBar()
    }else {
      return const AdminScreen()
    }
}else{
  const AuthScreen()
}
*/