// lib/screens/homescreen.dart
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern/constants.dart';
import 'package:intern/screens/detail.dart';
import 'package:intern/screens/new_task.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../controller.dart';
import '../models/task.dart';

class Homescreen extends StatefulWidget {
  
  const Homescreen({Key? key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int counter = 0;
    void _counterAdd(){
      setState(() {
        counter++;
      });
    }
  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.put(TaskController());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 210,
        leadingWidth: 290,
        leading: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "2024 6-р сарын 11 ",
                style: TextStyle(
                    color: primary, fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: "Hi, ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700)),
                    TextSpan(
                        text: "Хосчимэг.",
                        style: TextStyle(
                            color: primary,
                            fontSize: 28,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              Text(
                "Өнөөдрийн ард гарцгаая!",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  _counterAdd();
                  Get.to(() => NewTaskScreen(Counter: counter,));
                },
                child: Container(
                  width: 175,
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            border: Border.all(color: primary, width: 2),
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Шинэ Task",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/images/profile.png",
                    width: 60,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 1000,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Obx(() => GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.78,
                      ),
                      itemCount: taskController.tasks.length,
                      itemBuilder: (context, index) {
                        Task task = taskController.tasks[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => DetailScreen(task: task));
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "💼",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: primary,
                                    )
                                  ],
                                ),
                                SizedBox(height: 18),
                                Expanded(
                                  child: Text(
                                    task.title,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  task.completed ? "Completed" : "Pending",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.4),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    RotatedBox(
                                      quarterTurns: 3,
                                      child: LinearPercentIndicator(
                                        barRadius: Radius.circular(10),
                                        width: 70.0,
                                        lineHeight: 10.0,
                                        percent: task.completed ? 1.0 : 0.0,
                                        backgroundColor:
                                            primary.withOpacity(0.2),
                                        progressColor: primary,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Гүйцэтгэл",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          task.completed ? "100%" : "0%",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.dialog(
                                              AlertDialog(
                                                title: Text('Delete Task'),
                                                content: Text(
                                                    'Are you sure you want to delete this task?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Get.back();
                                                      taskController.deleteTask(
                                                          task);
                                                    },
                                                    child: Text('Yes'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: Text('No'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Icon(Icons.delete),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        GestureDetector(
                                          onTap: () {
                                            taskController.updateTask(Task(
                                              id: task.id,
                                              title: task.title,
                                              completed: !task.completed,
                                            ));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Icon(Icons.done),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
