import 'package:flutter/material.dart';
import 'package:learning_flutter/pages/add_todos.dart';
import 'package:learning_flutter/pages/all_folders.dart';
import 'package:learning_flutter/pages/create_folder.dart';
import 'package:learning_flutter/pages/todo_list.dart';

import 'package:learning_flutter/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),

      initialRoute: "/",
      routes: {
        '/': (context) => const WelcomePage(),
        '/all_folders': (context) =>  FolderScreen(),
        '/create_folder': (context) => const CreateFolder(),
        '/add_todos': (context) => const AddTodos(),
        '/todo_list': (context) => const TodoList(),
      },
    );
  }
}
