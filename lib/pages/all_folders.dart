import 'package:flutter/material.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({super.key});

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  // 🪄 Step 1: Create your folder data list
  final List<Map<String, dynamic>> folders = [
    {
      'name': 'Personal',
      'lists': 4,
      'color': Colors.pink[50],
      'textColor': Colors.pink,
      'icon': 'assets/welcome.jpeg',
      'link' : '/todo_list'
    },
    {
      'name': 'UXUI',
      'lists': 3,
      'color': Colors.green[50],
      'textColor': Colors.green,
      'icon': 'assets/welcom.jpeg',
      'link' : '/todo_list'
    },
    {
      'name': 'Writing',
      'lists': 8,
      'color': Colors.purple[50],
      'textColor': Colors.purple,
      'icon': 'assets/welcome.jpeg',
      'link' : '/todo_list'
    },
    {
      'name': 'Yoga',
      'lists': 2,
      'color': Colors.orange[50],
      'textColor': Colors.orange,
      'icon': 'assets/welcom.jpeg',
      'link' : '/todo_list'
    },
    {
      'name': 'Recipes',
      'lists': 7,
      'color': Colors.blue[50],
      'textColor': Colors.blue,
      'icon': 'assets/welcome.jpeg',
      'link' : '/todo_list'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The background of the entire screen
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text('Folders'),
        centerTitle: true,
        elevation: 0, // removes shadow under the appbar
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, // makes text/icons black
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: folders.length + 1, // +1 for "New Folder" card
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 boxes per row
            crossAxisSpacing: 16, // space between columns
            mainAxisSpacing: 16, // space between rows
            childAspectRatio: 1.1, // how wide/tall each card looks
          ),
          itemBuilder: (context, index) {
            // 🧩 Step 2: First card is special → “New Folder”
            if (index == 0) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/create_folder');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(2, 4), // how far the shadow moves
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, size: 40, color: Colors.blue),
                        SizedBox(height: 8),
                        Text(
                          'New Folder',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            // 🧱 Step 3: All the other folders
            final folder = folders[index - 1]; // shift by one

            return GestureDetector(
              onTap: () {
            Navigator.pushNamed(context, folder['link']);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: folder['color'],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(3, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Folder image
                    Expanded(
                      child: Image.asset(
                        folder['icon'],
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Folder name text
                    Text(
                      folder['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: folder['textColor'],
                      ),
                    ),
                    // “Lists” text
                    Text(
                      '${folder['lists']} Lists',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const Spacer(),
                    // Arrow at bottom right
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: folder['textColor'],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
