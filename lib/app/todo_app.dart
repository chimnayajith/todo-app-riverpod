import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.dark,
        theme: ThemeData(
            useMaterial3: true,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        darkTheme: ThemeData.dark(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
