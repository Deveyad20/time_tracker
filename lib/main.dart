import 'package:flutter/material.dart';
import 'time_tracker_app.dart';
import 'services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize storage service
  final storageService = StorageService();
  await storageService.initialize();

  runApp(const TimeTrackerApp());
}
