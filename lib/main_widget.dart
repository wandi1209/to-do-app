import 'package:flutter/material.dart';
import 'package:todoapp/add_to_do.dart';

class Mainwidget extends StatefulWidget {
  const Mainwidget({super.key});

  @override
  State<Mainwidget> createState() => _MainwidgetState();
}

class _MainwidgetState extends State<Mainwidget> {
  String text = "Simple Text";
  List<String> todoList = ["Drink", "Eat", "Sleep"];
  void changeText({required String todoText}) {
    setState(() {
      text = todoText;
    });
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
                          changeText: changeText,
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
              onTap: () {},
              title: Text(todoList[index]),
            );
          }),
    );
  }
}
