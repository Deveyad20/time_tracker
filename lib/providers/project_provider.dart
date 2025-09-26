import 'package:flutter/foundation.dart';
import '../models/project.dart';
import '../services/storage_service.dart';

class ProjectProvider extends ChangeNotifier {
  final StorageService _storageService;
  List<Project> _projects = [];
  bool _isLoading = false;
  bool _isInitialized = false;

  ProjectProvider(this._storageService);

  Future<void> initialize() async {
    await _loadProjects();
  }

  List<Project> get projects => List.unmodifiable(_projects);
  List<Project> get activeProjects => _projects.where((p) => p.isActive).toList();
  bool get isLoading => _isLoading;

  Future<void> _loadProjects() async {
    _isLoading = true;
    // Don't call notifyListeners() here during initial load

    try {
      _projects = await _storageService.getProjects();
      _projects.sort((a, b) => a.name.compareTo(b.name));
    } catch (e) {
      debugPrint('Error loading projects: $e');
      _projects = [];
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

  Future<void> addProject(Project project) async {
    try {
      await _storageService.saveProject(project);
      _projects.add(project);
      _projects.sort((a, b) => a.name.compareTo(b.name));
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding project: $e');
      rethrow;
    }
  }

  Future<void> updateProject(Project project) async {
    try {
      await _storageService.updateProject(project);
      final index = _projects.indexWhere((p) => p.id == project.id);
      if (index != -1) {
        _projects[index] = project;
        _projects.sort((a, b) => a.name.compareTo(b.name));
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error updating project: $e');
      rethrow;
    }
  }

  Future<void> deleteProject(String id) async {
    try {
      await _storageService.deleteProject(id);
      _projects.removeWhere((project) => project.id == id);
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleting project: $e');
      rethrow;
    }
  }

  Project? getProjectById(String id) {
    return _projects.firstWhere((project) => project.id == id);
  }

  Future<void> refresh() async {
    await _loadProjects();
  }
}