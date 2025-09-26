import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/time_entry.dart';
import '../models/project.dart';
import '../models/task.dart';

class StorageService {
  static const String _timeEntriesKey = 'time_entries';
  static const String _projectsKey = 'projects';
  static const String _tasksKey = 'tasks';

  late SharedPreferences _prefs;
  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    _prefs = await SharedPreferences.getInstance();
    _isInitialized = true;
  }

  // TimeEntry methods
  Future<List<TimeEntry>> getTimeEntries() async {
    await _ensureInitialized();
    final data = _prefs.getString(_timeEntriesKey);
    if (data == null) return [];

    final List<dynamic> entries = json.decode(data) as List<dynamic>;
    return entries.map((json) => TimeEntry.fromJson(json)).toList();
  }

  Future<void> saveTimeEntry(TimeEntry entry) async {
    await _ensureInitialized();
    final entries = await getTimeEntries();
    entries.add(entry);
    await _prefs.setString(_timeEntriesKey, json.encode(entries.map((e) => e.toJson()).toList()));
  }

  Future<void> updateTimeEntry(TimeEntry entry) async {
    await _ensureInitialized();
    final entries = await getTimeEntries();
    final index = entries.indexWhere((e) => e.id == entry.id);
    if (index != -1) {
      entries[index] = entry;
      await _prefs.setString(_timeEntriesKey, json.encode(entries.map((e) => e.toJson()).toList()));
    }
  }

  Future<void> deleteTimeEntry(String id) async {
    await _ensureInitialized();
    final entries = await getTimeEntries();
    entries.removeWhere((entry) => entry.id == id);
    await _prefs.setString(_timeEntriesKey, json.encode(entries.map((e) => e.toJson()).toList()));
  }

  // Project methods
  Future<List<Project>> getProjects() async {
    await _ensureInitialized();
    final data = _prefs.getString(_projectsKey);
    if (data == null) return [];

    final List<dynamic> projects = json.decode(data) as List<dynamic>;
    return projects.map((json) => Project.fromJson(json)).toList();
  }

  List<Project> getProjectsSync() {
    if (!_isInitialized) return [];
    final data = _prefs.getString(_projectsKey);
    if (data == null) return [];

    final List<dynamic> projects = json.decode(data) as List<dynamic>;
    return projects.map((json) => Project.fromJson(json)).toList();
  }

  Future<void> saveProject(Project project) async {
    await _ensureInitialized();
    final projects = await getProjects();
    projects.add(project);
    await _prefs.setString(_projectsKey, json.encode(projects.map((p) => p.toJson()).toList()));
  }

  Future<void> updateProject(Project project) async {
    await _ensureInitialized();
    final projects = await getProjects();
    final index = projects.indexWhere((p) => p.id == project.id);
    if (index != -1) {
      projects[index] = project;
      await _prefs.setString(_projectsKey, json.encode(projects.map((p) => p.toJson()).toList()));
    }
  }

  Future<void> deleteProject(String id) async {
    await _ensureInitialized();
    final projects = await getProjects();
    projects.removeWhere((project) => project.id == id);
    await _prefs.setString(_projectsKey, json.encode(projects.map((p) => p.toJson()).toList()));
  }

  // Task methods
  Future<List<Task>> getTasks() async {
    await _ensureInitialized();
    final data = _prefs.getString(_tasksKey);
    if (data == null) return [];

    final List<dynamic> tasks = json.decode(data) as List<dynamic>;
    return tasks.map((json) => Task.fromJson(json)).toList();
  }

  List<Task> getTasksSync() {
    if (!_isInitialized) return [];
    final data = _prefs.getString(_tasksKey);
    if (data == null) return [];

    final List<dynamic> tasks = json.decode(data) as List<dynamic>;
    return tasks.map((json) => Task.fromJson(json)).toList();
  }

  Future<void> saveTask(Task task) async {
    await _ensureInitialized();
    final tasks = await getTasks();
    tasks.add(task);
    await _prefs.setString(_tasksKey, json.encode(tasks.map((t) => t.toJson()).toList()));
  }

  Future<void> updateTask(Task task) async {
    await _ensureInitialized();
    final tasks = await getTasks();
    final index = tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      tasks[index] = task;
      await _prefs.setString(_tasksKey, json.encode(tasks.map((t) => t.toJson()).toList()));
    }
  }

  Future<void> deleteTask(String id) async {
    await _ensureInitialized();
    final tasks = await getTasks();
    tasks.removeWhere((task) => task.id == id);
    await _prefs.setString(_tasksKey, json.encode(tasks.map((t) => t.toJson()).toList()));
  }

  Future<void> clearAllData() async {
    await _ensureInitialized();
    await _prefs.clear();
  }

  Future<void> _ensureInitialized() async {
    if (!_isInitialized) {
      await initialize();
    }
  }
}