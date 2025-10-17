import 'package:flutter/material.dart';

class CreateFolder extends StatefulWidget {
  const CreateFolder({super.key});

  @override
  State<CreateFolder> createState() => _CreateFolderState();
}

class _CreateFolderState extends State<CreateFolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create new Folder",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
      ),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                autofocus: true,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                
                  // filled: true,
                  // fillColor: Colors.grey[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.teal, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.teal, width: 1.0),
                  ),
                ),
              ),
            ),

             Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      
                      onPressed: () {
                        Navigator.pushNamed(context, '/all_folders');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        
                      ),
                      
                      child: Text("Create Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),),
                      
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
