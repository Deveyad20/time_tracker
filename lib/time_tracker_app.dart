import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/time_entry_provider.dart';
import 'providers/project_provider.dart';
import 'providers/task_provider.dart';
import 'services/storage_service.dart';
import 'screens/time_entries_screen.dart';
import 'screens/add_time_entry_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/tasks_screen.dart';
import 'screens/settings_screen.dart';

class TimeTrackerApp extends StatelessWidget {
  const TimeTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<StorageService>(create: (_) => StorageService()),
        ChangeNotifierProxyProvider<StorageService, TimeEntryProvider>(
          create: (context) =>
              TimeEntryProvider(context.read<StorageService>()),
          update: (context, storage, previous) =>
              previous ?? TimeEntryProvider(storage),
        ),
        ChangeNotifierProxyProvider<StorageService, ProjectProvider>(
          create: (context) => ProjectProvider(context.read<StorageService>()),
          update: (context, storage, previous) =>
              previous ?? ProjectProvider(storage),
        ),
        ChangeNotifierProxyProvider<StorageService, TaskProvider>(
          create: (context) => TaskProvider(context.read<StorageService>()),
          update: (context, storage, previous) =>
              previous ?? TaskProvider(storage),
        ),
      ],
      child: AppInitializationWrapper(
        child: MaterialApp(
          title: 'Time Tracker',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFF6366F1), // Modern indigo
              brightness: Brightness.light,
              primary: Color(0xFF6366F1),
              primaryContainer: Color(0xFFE0E7FF),
              secondary: Color(0xFF10B981), // Emerald
              secondaryContainer: Color(0xFFD1FAE5),
              tertiary: Color(0xFFF59E0B), // Amber
              tertiaryContainer: Color(0xFFFEF3C7),
              surface: Color(0xFFFAFAFA),
              surfaceVariant: Color(0xFFF1F5F9),
            ),
            useMaterial3: true,
            cardTheme: CardThemeData(
              elevation: 4,
              shadowColor: Color(0xFF6366F1).withOpacity(0.15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 3,
                shadowColor: Color(0xFF6366F1).withOpacity(0.25),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Color(0xFFF8FAFC),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Color(0xFF6366F1),
                  width: 2,
                ),
              ),
              labelStyle: TextStyle(
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
            appBarTheme: AppBarTheme(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              foregroundColor: Color(0xFF1E293B),
              titleTextStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1E293B),
                letterSpacing: 0.3,
              ),
              shadowColor: Colors.transparent,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Color(0xFF6366F1),
              foregroundColor: Colors.white,
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              extendedSizeConstraints: BoxConstraints.tightFor(
                width: 56,
                height: 56,
              ),
            ),
            tabBarTheme: TabBarThemeData(
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFF818CF8),
              brightness: Brightness.dark,
              primary: Color(0xFF818CF8),
              primaryContainer: Color(0xFF312E81),
              secondary: Color(0xFF34D399),
              secondaryContainer: Color(0xFF064E3B),
              tertiary: Color(0xFFFBBF24),
              tertiaryContainer: Color(0xFF78350F),
              surface: Color(0xFF0F172A),
              surfaceVariant: Color(0xFF1E293B),
            ),
            useMaterial3: true,
            cardTheme: CardThemeData(
              elevation: 4,
              shadowColor: Color(0xFF818CF8).withOpacity(0.15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 3,
                shadowColor: Color(0xFF818CF8).withOpacity(0.25),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Color(0xFF1E293B),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Color(0xFF818CF8),
                  width: 2,
                ),
              ),
              labelStyle: TextStyle(
                color: Color(0xFF94A3B8),
                fontWeight: FontWeight.w500,
              ),
            ),
            appBarTheme: AppBarTheme(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              foregroundColor: Color(0xFFF1F5F9),
              titleTextStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFFF1F5F9),
                letterSpacing: 0.3,
              ),
              shadowColor: Colors.transparent,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Color(0xFF818CF8),
              foregroundColor: Colors.white,
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              extendedSizeConstraints: BoxConstraints.tightFor(
                width: 56,
                height: 56,
              ),
            ),
            tabBarTheme: TabBarThemeData(
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          themeMode: ThemeMode.system,
          home: MainScreen(),
          routes: {
            '/add-time-entry': (context) => AddTimeEntryScreen(),
          },
        ),
      ),
    );
  }
}

class AppInitializationWrapper extends StatefulWidget {
  final Widget child;

  const AppInitializationWrapper({super.key, required this.child});

  @override
  State<AppInitializationWrapper> createState() => _AppInitializationWrapperState();
}

class _AppInitializationWrapperState extends State<AppInitializationWrapper> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeProviders();
  }

  Future<void> _initializeProviders() async {
    try {
      final timeEntryProvider = context.read<TimeEntryProvider>();
      final projectProvider = context.read<ProjectProvider>();
      final taskProvider = context.read<TaskProvider>();

      // Initialize all providers
      await timeEntryProvider.initialize();
      await projectProvider.initialize();
      await taskProvider.initialize();

      // Mark providers as initialized to enable notifications
      timeEntryProvider.markInitialized();
      projectProvider.markInitialized();
      taskProvider.markInitialized();

      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      debugPrint('Error initializing providers: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return widget.child;
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const TimeEntriesScreen(),
    const ProjectsScreen(),
    const TasksScreen(),
    const SettingsScreen(),
  ];

  final List<String> _titles = [
    'Time Tracker',
    'Projects',
    'Tasks',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        title: Text(
          _titles[_selectedIndex],
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        actions: _selectedIndex == 0 ? [
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.add_rounded),
              onPressed: () => Navigator.pushNamed(context, '/add-time-entry'),
              tooltip: 'Add Time Entry',
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ] : null,
      ),
      drawer: _buildDrawer(),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
        ),
        child: _screens[_selectedIndex],
      ),
    );
  }

  Widget _buildDrawer() {
    // Make drawer width responsive for small devices
    final double screenWidth = MediaQuery.of(context).size.width;
    final double drawerWidth = screenWidth > 400 ? 280 : screenWidth * 0.8;

    return Drawer(
      width: drawerWidth,
      child: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withOpacity(0.8),
                ],
              ),
            ),
          ),

          // Content
          Column(
            children: [
              // Modern Header
              Container(
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primary.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.timer_outlined,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Time Tracker',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Professional time management',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),

              // Navigation Items Container with scrolling
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 32),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Main Navigation
                        _buildNavigationItem(
                          icon: Icons.dashboard_rounded,
                          label: 'Dashboard',
                          isSelected: _selectedIndex == 0,
                          onTap: () {
                            setState(() => _selectedIndex = 0);
                            Navigator.pop(context);
                          },
                        ),
                        _buildNavigationItem(
                          icon: Icons.folder_rounded,
                          label: 'Projects',
                          isSelected: _selectedIndex == 1,
                          onTap: () {
                            setState(() => _selectedIndex = 1);
                            Navigator.pop(context);
                          },
                        ),
                        _buildNavigationItem(
                          icon: Icons.task_rounded,
                          label: 'Tasks',
                          isSelected: _selectedIndex == 2,
                          onTap: () {
                            setState(() => _selectedIndex = 2);
                            Navigator.pop(context);
                          },
                        ),

                        const SizedBox(height: 8),

                        // Divider
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          height: 1,
                          color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
                        ),

                        const SizedBox(height: 8),

                        // Secondary Actions
                        _buildNavigationItem(
                          icon: Icons.settings_rounded,
                          label: 'Settings',
                          isSelected: _selectedIndex == 3,
                          onTap: () {
                            setState(() => _selectedIndex = 3);
                            Navigator.pop(context);
                          },
                          isSecondary: true,
                        ),
                        _buildNavigationItem(
                          icon: Icons.add_rounded,
                          label: 'Quick Add Entry',
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/add-time-entry');
                          },
                          isSecondary: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItem({
    required IconData icon,
    required String label,
    bool isSelected = false,
    bool isSecondary = false,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: isSelected
            ? Border.all(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                width: 1,
              )
            : null,
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                : isSecondary
                    ? Theme.of(context).colorScheme.outline.withOpacity(0.1)
                    : Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : isSecondary
                    ? Theme.of(context).colorScheme.outline
                    : Theme.of(context).colorScheme.primary,
            size: 20,
          ),
        ),
        title: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : isSecondary
                    ? Theme.of(context).colorScheme.outline
                    : Theme.of(context).colorScheme.onSurface,
          ),
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
