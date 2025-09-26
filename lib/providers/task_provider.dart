import 'package:flutter/foundation.dart';
import '../models/task.dart';
import '../services/storage_service.dart';

class TaskProvider extends ChangeNotifier {
  final StorageService _storageService;
  List<Task> _tasks = [];
  bool _isLoading = false;
  bool _isInitialized = false;

  TaskProvider(this._storageService);

  Future<void> initialize() async {
    await _loadTasks();
  }

  List<Task> get tasks => List.unmodifiable(_tasks);
  List<Task> get activeTasks => _tasks.where((t) => t.isActive).toList();
  bool get isLoading => _isLoading;

  Future<void> _loadTasks() async {
    _isLoading = true;
    // Don't call notifyListeners() here during initial load

    try {
      _tasks = await _storageService.getTasks();
      _tasks.sort((a, b) => a.name.compareTo(b.name));
    } catch (e) {
      debugPrint('Error loading tasks: $e');
      _tasks = [];
    } finally {
      _isLoading = false;
      // Only notify after initial load is complete
      if (_isInitialized) {
        notifyListeners();
      }
    }
  }

  void markInitialized() {
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    try {
      await _storageService.saveTask(task);
      _tasks.add(task);
      _tasks.sort((a, b) => a.name.compareTo(b.name));
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding task: $e');
      rethrow;
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await _storageService.updateTask(task);
      final index = _tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        _tasks[index] = task;
        _tasks.sort((a, b) => a.name.compareTo(b.name));
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error updating task: $e');
      rethrow;
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await _storageService.deleteTask(id);
      _tasks.removeWhere((task) => task.id == id);
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleting task: $e');
      rethrow;
    }
  }

  List<Task> getTasksForProject(String projectId) {
    return _tasks.where((task) => task.projectId == projectId && task.isActive).toList();
  }

  Task? getTaskById(String id) {
    return _tasks.firstWhere((task) => task.id == id);
  }

  Future<void> refresh() async {
    await _loadTasks();
  }
}