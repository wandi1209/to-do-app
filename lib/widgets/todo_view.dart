import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodoView extends StatefulWidget {
  List<String> todoList;
  void Function() updateLocalData;
  TodoView({
    super.key,
    required this.todoList,
    required this.updateLocalData,
  });

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    return (widget.todoList.isEmpty)
        ? Center(child: Text("No item on your to do list."))
        : ListView.builder(
            itemCount: widget.todoList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.green,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.check),
                      ),
                    ],
                  ),
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    widget.todoList.removeAt(index);
                  });
                  widget.updateLocalData();
                },
                child: ListTile(
                  title: Text(
                    widget.todoList[index],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            });
  }
}
