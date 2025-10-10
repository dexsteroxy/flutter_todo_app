import 'package:flutter/material.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD TODOS", style: TextStyle(fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              child: TextField(
                autocorrect: true,
                autofocus: true,
                decoration: InputDecoration(hintText: "Add your schedules"),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(),
                child: Text("Add Me", style: TextStyle(fontSize: 17)),
              ),
            ),
SizedBox(height: 10,),
            SizedBox(
              child: Text(" Created by Sixtus Amadi @All | Right | Reserved",style: TextStyle(
                color: const Color.fromARGB(255, 106, 136, 146)
              ),),
            
            )
          ],
        ),
      ),
    );
  }
}
