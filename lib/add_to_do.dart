import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddToDo extends StatefulWidget {
  void Function({required String todoText}) addTodo;
  AddToDo({super.key, required this.addTodo});

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  TextEditingController todoText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Add Todo:"),
        TextField(
          controller: todoText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            hintText: "Write your todo here...",
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            widget.addTodo(todoText: todoText.text);
            todoText.text = '';
          },
          child: Text("Add"),
        )
      ],
    );
  }
}
