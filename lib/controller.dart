// lib/controllers/task_controller.dart

import 'package:get/get.dart';
import '../models/task.dart';
import '../API/api.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    fetchTasks();
    super.onInit();
  }

  void fetchTasks() async {
    try {
      var fetchedTasks = await _apiService.fetchTasks();
      tasks.assignAll(fetchedTasks);
    } catch (e) {
      print('Error fetching tasks: $e');
    }
  }

  void addTask(Task task) async {
    try {
      var createdTask = await _apiService.createTask(task);
      tasks.insert(0, createdTask);
    } catch (e) {
      print('Error adding task: $e');
    }
  }

  void updateTask(Task task) async {
    try {
      var updatedTask = await _apiService.updateTask(task);
      var index = tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        tasks[index] = updatedTask;
      }
    } catch (e) {
      print('Error updating task: $e');
      Get.snackbar(
        'Error',
        'Failed to update task. Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void deleteTask(Task task) async {
    try {
      print('Deleting task with ID: ${task.id}');
      await _apiService.deleteTask(task.id);
      tasks.removeWhere((t) => t.id == task.id);
    } catch (e) {
      print('Error deleting task: $e');
    }
  }
}
