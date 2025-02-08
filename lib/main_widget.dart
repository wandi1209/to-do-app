import 'package:flutter/material.dart';
import 'package:todoapp/add_to_do.dart';

class Mainwidget extends StatefulWidget {
  const Mainwidget({super.key});

  @override
  State<Mainwidget> createState() => _MainwidgetState();
}

class _MainwidgetState extends State<Mainwidget> {
  List<String> todoList = [];

  void addTodo({required String todoText}) {
    setState(() {
      todoList.insert(0, todoText);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Text("Drawer Data"),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("To Do App"),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 190,
                        child: AddToDo(
                          addTodo: addTodo,
                        ),
                      ),
                    );
                  });
            },
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.add,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () {
                              setState(() {
                                todoList.removeAt(index);
                              });
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Mark as Done!",
                              style: TextStyle(color: Colors.white),
                            )),
                      );
                    });
              },
              title: Text(
                todoList[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }),
    );
  }
}
