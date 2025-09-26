import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';
import '../models/time_entry.dart';
import '../models/project.dart';
import '../models/task.dart';
import '../services/storage_service.dart';

class TimeEntryProvider extends ChangeNotifier {
  final StorageService _storageService;
  List<TimeEntry> _entries = [];
  bool _isLoading = false;
  bool _isInitialized = false;

  TimeEntryProvider(this._storageService);

  Future<void> initialize() async {
    await _loadEntries();
  }

  List<TimeEntry> get entries => List.unmodifiable(_entries);
  bool get isLoading => _isLoading;

  Future<void> _loadEntries() async {
    _isLoading = true;
    // Don't call notifyListeners() here during initial load

    try {
      _entries = await _storageService.getTimeEntries();
      _entries.sort((a, b) => b.date.compareTo(a.date));
    } catch (e) {
      debugPrint('Error loading time entries: $e');
      _entries = [];
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

  Future<void> addEntry(TimeEntry entry) async {
    try {
      await _storageService.saveTimeEntry(entry);
      _entries.add(entry);
      _entries.sort((a, b) => b.date.compareTo(a.date));
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding time entry: $e');
      rethrow;
    }
  }

  Future<void> updateEntry(TimeEntry entry) async {
    try {
      await _storageService.updateTimeEntry(entry);
      final index = _entries.indexWhere((e) => e.id == entry.id);
      if (index != -1) {
        _entries[index] = entry;
        _entries.sort((a, b) => b.date.compareTo(a.date));
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error updating time entry: $e');
      rethrow;
    }
  }

  Future<void> deleteEntry(String id) async {
    try {
      await _storageService.deleteTimeEntry(id);
      _entries.removeWhere((entry) => entry.id == id);
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleting time entry: $e');
      rethrow;
    }
  }

  List<TimeEntry> getEntriesForProject(String projectId) {
    return _entries.where((entry) => entry.projectId == projectId).toList();
  }

  List<TimeEntry> getEntriesForTask(String taskId) {
    return _entries.where((entry) => entry.taskId == taskId).toList();
  }

  List<TimeEntry> getEntriesForDateRange(DateTime start, DateTime end) {
    return _entries.where((entry) {
      final entryDate = DateTime(entry.date.year, entry.date.month, entry.date.day);
      final startDate = DateTime(start.year, start.month, start.day);
      final endDate = DateTime(end.year, end.month, end.day);
      return entryDate.compareTo(startDate) >= 0 && entryDate.compareTo(endDate) <= 0;
    }).toList();
  }

  Duration getTotalTimeForProject(String projectId) {
    return getEntriesForProject(projectId)
        .fold(Duration.zero, (total, entry) => total + entry.duration);
  }

  Duration getTotalTimeForTask(String taskId) {
    return getEntriesForTask(taskId)
        .fold(Duration.zero, (total, entry) => total + entry.duration);
  }

  Duration getTotalTimeForDateRange(DateTime start, DateTime end) {
    return getEntriesForDateRange(start, end)
        .fold(Duration.zero, (total, entry) => total + entry.duration);
  }

  Map<String, Duration> getTimeByProject() {
    final projects = _storageService.getProjectsSync();
    final result = <String, Duration>{};

    for (final project in projects) {
      result[project.id] = getTotalTimeForProject(project.id);
    }

    return result;
  }

  Map<String, Duration> getTimeByTask() {
    final tasks = _storageService.getTasksSync();
    final result = <String, Duration>{};

    for (final task in tasks) {
      result[task.id] = getTotalTimeForTask(task.id);
    }

    return result;
  }

  TimeEntry? getEntryById(String id) {
    return _entries.firstWhereOrNull((entry) => entry.id == id);
  }

  Future<void> refresh() async {
    await _loadEntries();
  }
}