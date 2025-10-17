import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // Example list of todos
  final List<Map<String, dynamic>> todos = [
    {
      'title': 'Pay for utility services',
      'des': 'this app is so lovely im already inlove this this great and beautiful cool app thanks sixtus for this',
      'category': ' Time: 12:41',
      'priority': 'Date: 14/10/2025',
      'isDone': false,
    },
    {
      'title': 'Buy groceries for mac & cheese',
    'category': ' Time: 12:41',
    'des': 'this app is so lovely im already inlove this this great and beautiful cool app thanks sixtus for this',
      'priority': '14/10/2025',
      'isDone': false,
    },
    {
      'title': 'Practice Piano',
      'des': '',
     'category': ' Time:12:41',
      'priority': 'Date: 14/10/2025',
      'isDone': false,
    },
  ];



  Color _getPriorityTextColor(String level) {
    switch (level) {
      case 'High':
        return Colors.red.shade700;
      case 'Medium':
        return Colors.purple.shade700;
      case 'Low':
        return Colors.blue.shade700;
      default:
        return Colors.grey.shade600;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          " Personal Todos",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        onPressed: () => Navigator.pushNamed(context, '/add_todos'),
        child: const Icon(Icons.add, size: 28),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.grey.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.close, size: 20, color: Colors.grey),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                       Text(
                        todo['des'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        todo['category'],
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                         
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          todo['priority'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: _getPriorityTextColor(todo['priority']),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Checkbox(
                  value: todo['isDone'],
                  onChanged: (val) {
                    setState(() => todos[index]['isDone'] = val);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
