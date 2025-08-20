import 'package:flutter/foundation.dart';

class Todo {
  String title;
  bool isDone;
  DateTime createdAt;

  Todo({required this.title, this.isDone = false, DateTime? createdAt})
    : createdAt = createdAt ?? DateTime(2025, 1, 1);

  void toggleDone() {
    isDone = !isDone;
  }
}


class TodoList extends ChangeNotifier {
  final List<Todo> _todos = [];
  List<Todo> get items => List.unmodifiable(_todos);

  void addTodo(String title) {
    _todos.add(Todo(title: title));
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    todo.toggleDone();
    notifyListeners();
  }
}