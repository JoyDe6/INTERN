import 'package:dio/dio.dart';
import '../models/task.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Task>> fetchTasks() async {
    final response = await _dio.get(baseUrl);
    return (response.data as List).map((task) => Task.fromJson(task)).toList();
  }

  Future<Task> createTask(Task task) async {
    final response = await _dio.post(baseUrl, data: task.toJson());
    return Task.fromJson(response.data);
  }

  Future<Task> updateTask(Task task) async {
    final response = await _dio.put('$baseUrl/${task.id}', data: task.toJson());
    return Task.fromJson(response.data);
  }

  Future<void> deleteTask(int id) async {
    await _dio.delete('$baseUrl/$id');
  }
}

