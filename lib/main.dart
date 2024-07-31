import 'package:flutter/material.dart';
import 'package:weightapp/pages/home.dart';
import 'package:weightapp/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RecipBook",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepOrange
            ),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
      },
          
    );
  }
}