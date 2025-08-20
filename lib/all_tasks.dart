import 'package:flutter/material.dart';
import 'package:flutter_training/model/todo.model.dart';
import 'package:provider/provider.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({super.key});

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoList = context.read<TodoList>();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateTime.now().toString().split(' ')[0],
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10),
            const Text('ToDo List', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 4,
        toolbarHeight: 150,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Add a new Task'),
              controller: textController,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  todoList.addTodo(textController.text);
                  textController.clear();
                },
                child: const Text('Add Todo'),
              ),
            ),

            Expanded(
              child: Consumer<TodoList>(
                builder: (context, todoList, child) {
                  return ListView.builder(
                    itemCount: todoList.items.length,
                    itemBuilder: (context, index) {
                      return _cardTask(context, todoList.items[index], index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _cardTask(BuildContext context, Todo todo, int index) {
  return Card(
    child: Row(
      children: [
        Checkbox(value: todo.isDone, onChanged: (value) {
          context.read<TodoList>().toggleTodo(todo);
        }),

        Expanded(
          child: ListTile(title: Text(todo.title, style: todo.isDone ? const TextStyle(decoration: TextDecoration.lineThrough) : null)),
        ),
        IconButton(
          onPressed: () {
            debugPrint('delete button pressed ${todo.title}');
            context.read<TodoList>().removeTodo(todo);
          }, 
          icon: const Icon(Icons.delete)
        ),
      ],
    )
  );
}
