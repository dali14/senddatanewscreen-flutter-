import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override


  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  TodosScreen(
        todos: List.generate(
          20,
              (i) => Todo(
            'Todo $i',
            'A description of what needs to be done for Todo $i',
          ),
        ),
      ),
    );
  }
}




  class TodosScreen extends StatelessWidget {
  // Requiring the list of todos.
  const TodosScreen({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: const Text('Todos'),
  ),
  //passing in the ListView.builder
  body: ListView.builder(
  itemCount: todos.length,
  itemBuilder: (context, index) {
  return ListTile(
  title: Text(todos[index].title),
  // When a user taps the ListTile, navigate to the DetailScreen.
  // Notice that you're not only creating a DetailScreen, you're
  // also passing the current todo through to it.
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) => DetailScreen(todo: todos[index]),
  ),
  );
  },
  );
  },
  ),

  );
  }
  }


  class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailScreen({Key? key, required this.todo}) : super(key: key);

  // Declare a field that holds the Todo.
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
}
class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);

}