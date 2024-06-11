// lib/screens/detail_screen.dart
// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/task.dart';

class DetailScreen extends StatelessWidget {
  final Task task;

  const DetailScreen({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              task.description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              "Status: ${task.completed ? 'Completed' : 'Pending'}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: task.completed ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
