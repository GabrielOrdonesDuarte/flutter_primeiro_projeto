import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto/app_controller.dart';
import 'package:flutter_primeiro_projeto/teste_page.dart';
import 'login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.green,
                brightness: AppController.instance.isDarkTheme
                    ? Brightness.dark
                    : Brightness.light),
            initialRoute: '/',
            routes: {
              '/': (context) => const LoginPage(),
              '/teste': (context) => const TestePage(),
            },
          );
        });
  }
}
