import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/time_entry_provider.dart';
import '../providers/project_provider.dart';
import '../providers/task_provider.dart';
import '../services/storage_service.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Data Management Section
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Data Management',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),

          // Export Data
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text('Export Data'),
            subtitle: const Text('Export all your time tracking data'),
            onTap: () => _showExportDialog(context),
          ),

          // Import Data
          ListTile(
            leading: const Icon(Icons.upload),
            title: const Text('Import Data'),
            subtitle: const Text('Import time tracking data from backup'),
            onTap: () => _showImportDialog(context),
          ),

          const Divider(),

          // Statistics Section
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Statistics',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),

          // Total Entries
          Consumer<TimeEntryProvider>(
            builder: (context, provider, child) {
              return ListTile(
                leading: const Icon(Icons.list),
                title: const Text('Total Time Entries'),
                trailing: Text(
                  '${provider.entries.length}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            },
          ),

          // Total Projects
          Consumer<ProjectProvider>(
            builder: (context, provider, child) {
              return ListTile(
                leading: const Icon(Icons.folder),
                title: const Text('Total Projects'),
                trailing: Text(
                  '${provider.projects.length}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            },
          ),

          // Total Tasks
          Consumer<TaskProvider>(
            builder: (context, provider, child) {
              return ListTile(
                leading: const Icon(Icons.task),
                title: const Text('Total Tasks'),
                trailing: Text(
                  '${provider.tasks.length}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            },
          ),

          const Divider(),

          // Data Operations Section
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Data Operations',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),

          // Clear All Data
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            title: const Text('Clear All Data'),
            subtitle: const Text('Permanently delete all time entries, projects, and tasks'),
            onTap: () => _showClearDataDialog(context),
          ),

          const Divider(),

          // About Section
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'About',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),

          const ListTile(
            leading: Icon(Icons.info),
            title: Text('Time Tracker'),
            subtitle: Text('Version 1.0.0'),
          ),

          const ListTile(
            leading: Icon(Icons.description),
            title: Text('About'),
            subtitle: Text('A simple time tracking app built with Flutter'),
          ),
        ],
      ),
    );
  }

  void _showExportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export Data'),
        content: const Text('This feature will allow you to export all your time tracking data to a JSON file. This feature is coming soon!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showImportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Import Data'),
        content: const Text('This feature will allow you to import time tracking data from a JSON backup file. This feature is coming soon!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showClearDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear All Data'),
        content: const Text(
          'Are you sure you want to permanently delete all your data? '
          'This action cannot be undone and will remove:\n\n'
          '• All time entries\n'
          '• All projects\n'
          '• All tasks\n\n'
          'This will reset the app to its initial state.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              try {
                final storageService = context.read<StorageService>();
                await storageService.clearAllData();

                // Refresh all providers
                await context.read<TimeEntryProvider>().refresh();
                await context.read<ProjectProvider>().refresh();
                await context.read<TaskProvider>().refresh();

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('All data cleared successfully')),
                );
              } catch (e) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error clearing data: $e')),
                );
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Clear All Data'),
          ),
        ],
      ),
    );
  }
}