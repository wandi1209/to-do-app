import 'package:flutter/material.dart';

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
                      height: 250,
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
      body: GestureDetector(
          onTap: () {
            print("Body");
          },
          child: Text("Body")),
    );
  }
}
