// ignore_for_file: prefer_const_constructors, unused_local_variable, non_constant_identifier_names, use_super_parameters, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller.dart';
import '../models/task.dart';

class NewTaskScreen extends StatefulWidget {
  final int Counter;
  const NewTaskScreen({Key? key, required this.Counter}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
   
  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find();

    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

   

    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
            
                String title = titleController.text.trim();
                String description = descriptionController.text.trim();

                if (title.isNotEmpty) {
         
                  int uniqueId = 200 + widget.Counter;
                  

                 
                  Task newTask = Task(
                    
                    id: 200 + widget.Counter,
                    title: title,
                    completed: false,
                    description: description,
                  );

           
                  taskController.addTask(newTask);
                  print("shine task id: ${newTask.id}.");
                  Get.back();
                } else {
                  Get.snackbar(
                    'Error',
                    'Please enter a title for the task.',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Text('Create Task'),
            ),
          ],
        ),
      ),
    );
  }
}
