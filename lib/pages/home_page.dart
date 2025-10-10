import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo List by Sixtus",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add-todo-screen");
        },
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 16.00),
        child: ListView.separated(
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              title: Text(
                "Moonkey",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              trailing: Wrap(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                    style: ButtonStyle(
                      iconColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 235, 183, 179),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: 2,
        ),
      ),
    );
  }
}
