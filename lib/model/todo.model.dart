import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Local_storage/shared_preferences.dart';

class Todo {
  String title;
  bool isDone;
  DateTime createdAt;

  Todo({required this.title, this.isDone = false, DateTime? createdAt})
    : createdAt = createdAt ?? DateTime(2025, 1, 1);

  void toggleDone() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'],
      isDone: map['isDone'] ?? false,
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}

class TodoList extends ChangeNotifier {
  final List<Todo> _todos = [];
  List<Todo> get items => List.unmodifiable(_todos);
  // late final LocalStorage localStorage;

  Future<void> addTodo(String title) async {
    _todos.add(Todo(title: title));
    notifyListeners();
    await LocalStorage.setStringList(
      'todos',
      _todos.map((todo) => jsonEncode(todo.toMap())).toList(),
    );
  }

  Future<void> removeTodo(Todo todo) async {
    _todos.remove(todo);
    await LocalStorage.setStringList(
      'todos',
      _todos.map((todo) => jsonEncode(todo.toMap())).toList(),
    );
    notifyListeners();
  }

  Future<void> toggleTodo(Todo todo) async {
    todo.toggleDone();
    await LocalStorage.setStringList(
      'todos',
      _todos.map((todo) => jsonEncode(todo.toMap())).toList(),
    );
    notifyListeners();
  }

  Future<void> loadTodos() async {
    final todos = await LocalStorage.getStringList('todos') ?? [];
    for (String todoData in todos) {
      try {
        final todoMap = jsonDecode(todoData);
        _todos.add(Todo.fromMap(todoMap));
      } catch (e) {
        // Handle old format data (just strings)
        _todos.add(Todo(title: todoData));
      }
    }

    notifyListeners();
  }
}
