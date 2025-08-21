import 'package:flutter/material.dart';
import 'package:flutter_training/all_tasks.dart';
import 'package:provider/provider.dart';
import 'package:flutter_training/model/todo.model.dart';
import 'package:flutter_training/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoList(),
      child: MaterialApp.router(
        title: 'Todo (Provider)',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}




