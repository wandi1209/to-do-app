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
      appBar: AppBar(
        title: Text("To Do App"),
      ),
    );
  }
}
