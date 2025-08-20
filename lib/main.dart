import 'package:flutter/material.dart';
import 'package:flutter_training/all_tasks.dart';
import 'package:provider/provider.dart';
import 'package:flutter_training/model/todo.model.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoList(),
      child: const MaterialApp(
        title: 'Todo (Provider)',
        debugShowCheckedModeBanner: false,
        home: AllTasks(),
      ),
    );
  }
}


