import 'package:flutter/material.dart';
import 'package:todoapp/add_to_do.dart';

class Mainwidget extends StatefulWidget {
  const Mainwidget({super.key});

  @override
  State<Mainwidget> createState() => _MainwidgetState();
}

class _MainwidgetState extends State<Mainwidget> {
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
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      height: 200,
                      child: AddToDo(),
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
      body: Container(),
    );
  }
}
