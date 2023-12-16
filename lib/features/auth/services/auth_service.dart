import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/components/utils.dart';
import 'package:flutter_store_nodjs/features/home/screens/home_screen.dart';

import '../../../components/myconstans.dart';
import '../../../components/error_handling.dart';
import '../../../providers/user_provider.dart';
import '../../../models/user.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String authTokenKey = 'app-auth-token';
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        type: '',
        token: '',
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (context.mounted) {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'Account created! Login with the same credentials!');
          },
        );
      }
    } catch (e) {
      if (context.mounted) showSnackBar(context, e.toString());
    }
  }

  // sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (context.mounted) {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            //showSnackBar(context, 'Login Success !!');
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            if (context.mounted) {
              Provider.of<UserProvider>(context, listen: false)
                  .setUser(res.body);
            }
            await sharedPreferences.setString(
                authTokenKey, jsonDecode(res.body)['token']);

            if (context.mounted) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomeScreen.routeName,
                (route) => false,
              );
            }
          },
        );
      }
    } catch (e) {
      if (context.mounted) showSnackBar(context, e.toString());
    }
  }

  void getUserData(BuildContext context) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String? token = sp.getString(authTokenKey);

      if (token == null) {
        sp.setString(authTokenKey, '');
      }

      var resToken = await http.post(Uri.parse('$uri/isValidToken'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
            authTokenKey: token!
          });

      var response = jsonDecode(resToken.body);

      if (response == true) {
        http.Response userRes = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=utf-8',
              authTokenKey: token
            });
        if (context.mounted) {
          var userProvider = Provider.of<UserProvider>(context, listen: false);
          userProvider.setUser(userRes.body);
        }
      }
    } catch (err) {
      if (context.mounted) showSnackBar(context, err.toString());
    }
  }

  Future<void> clearAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(
        authTokenKey); // This will remove the authTokenKey key from shared preferences
  }
}
