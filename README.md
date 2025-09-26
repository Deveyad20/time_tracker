# ⏱️ Time Tracker

[![Flutter](https://img.shields.io/badge/Flutter-3.24.0-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.5.0-blue.svg)](https://dart.dev)
[![Material Design 3](https://img.shields.io/badge/Material_Design_3-1.0-green.svg)](https://m3.material.io)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> **Professional Time Management Made Simple**
>
> A modern, feature-rich time tracking application built with Flutter and Material Design 3. Track your projects, manage tasks, and analyze productivity with style and precision.

![Time Tracker Pro](https://via.placeholder.com/800x400/6366F1/FFFFFF?text=Time+Tracker+Pro)

## ✨ Features

### 🎯 **Core Functionality**
- **📊 Dashboard**: Comprehensive overview of time entries and productivity
- **📁 Project Management**: Organize work by projects with custom colors and descriptions
- **✅ Task Tracking**: Create and manage tasks with status indicators
- **⏰ Time Entries**: Detailed time logging with notes and project associations
- **📈 Analytics**: Visual insights into time allocation and productivity patterns

### 🎨 **Modern UI/UX**
- **Material Design 3**: Latest design system with dynamic color theming
- **Smooth Animations**: Fluid transitions and micro-interactions
- **Responsive Design**: Optimized for mobile, tablet, and desktop
- **Dark/Light Theme**: Automatic theme switching with system preference
- **Professional Cards**: Modern card designs with gradients and shadows

### 🔧 **Advanced Features**
- **Data Persistence**: Local storage with provider state management
- **Filtering & Search**: Advanced filtering by projects and date ranges
- **Export & Backup**: Data export capabilities for reporting
- **Offline Support**: Full functionality without internet connection
- **Performance Optimized**: Efficient rendering and memory management

## 🚀 Screenshots

<div align="center">
  <img src="https://via.placeholder.com/300x600/6366F1/FFFFFF?text=Dashboard" alt="Dashboard" width="300" height="600" style="margin: 10px; border-radius: 20px; box-shadow: 0 8px 32px rgba(99, 102, 241, 0.3);"/>
  <img src="https://via.placeholder.com/300x600/10B981/FFFFFF?text=Projects" alt="Projects" width="300" height="600" style="margin: 10px; border-radius: 20px; box-shadow: 0 8px 32px rgba(16, 185, 129, 0.3);"/>
  <img src="https://via.placeholder.com/300x600/F59E0B/FFFFFF?text=Tasks" alt="Tasks" width="300" height="600" style="margin: 10px; border-radius: 20px; box-shadow: 0 8px 32px rgba(245, 158, 11, 0.3);"/>
</div>

## 🛠️ Installation

### Prerequisites
- **Flutter SDK**: 3.24.0 or higher
- **Dart SDK**: 3.5.0 or higher
- **Android Studio**: For Android development
- **Xcode**: For iOS development (macOS only)
- **VS Code** or **IntelliJ IDEA**: Recommended IDEs

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/time-tracker-pro.git
   cd time-tracker-pro
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   # For Android
   flutter run -d android

   # For iOS
   flutter run -d ios

   # For Web
   flutter run -d chrome

   # For Desktop (Windows/Linux/macOS)
   flutter run -d windows  # or linux, macos
   ```

## 📱 Supported Platforms

| Platform | Status | Minimum Version |
|----------|--------|-----------------|
| **Android** | ✅ Supported | API 21+ |
| **iOS** | ✅ Supported | iOS 12+ |
| **Web** | ✅ Supported | Chrome 90+ |
| **Windows** | ✅ Supported | Windows 10+ |
| **macOS** | ✅ Supported | macOS 10.15+ |
| **Linux** | ✅ Supported | Ubuntu 18.04+ |

## 🏗️ Architecture

### **Project Structure**
```
lib/
├── providers/          # State management providers
│   ├── time_entry_provider.dart
│   ├── project_provider.dart
│   └── task_provider.dart
├── screens/            # UI screens
│   ├── time_entries_screen.dart
│   ├── projects_screen.dart
│   ├── tasks_screen.dart
│   └── settings_screen.dart
├── models/             # Data models
│   ├── time_entry.dart
│   ├── project.dart
│   └── task.dart
├── services/           # Business logic services
│   └── storage_service.dart
└── time_tracker_app.dart # Main application
```

### **Design Patterns**
- **Provider Pattern**: For state management
- **Repository Pattern**: For data access
- **MVVM Architecture**: Model-View-ViewModel pattern
- **Dependency Injection**: Service locator pattern

### **Key Technologies**
- **Flutter**: Cross-platform UI framework
- **Material Design 3**: Modern design system
- **Provider**: State management solution
- **Shared Preferences**: Local data persistence
- **Intl**: Internationalization support

## 🎯 Key Features Deep Dive

### **Time Entry Management**
- ⏱️ **Precise Time Tracking**: Second-accurate time logging
- 📝 **Rich Notes**: Support for detailed descriptions and notes
- 🏷️ **Project Association**: Link time entries to specific projects
- 📊 **Analytics**: Visual breakdown of time allocation

### **Project Organization**
- 🎨 **Color Coding**: Visual project identification with custom colors
- 📋 **Hierarchical Structure**: Projects contain tasks and time entries
- 📈 **Progress Tracking**: Monitor project completion and time spent
- 🔄 **Status Management**: Active/inactive project states

### **Task Management**
- ✅ **Status Tracking**: Active/inactive task states
- 📅 **Time Allocation**: Track time spent per task
- 🔗 **Project Linking**: Associate tasks with specific projects
- 📝 **Detailed Descriptions**: Rich task descriptions and notes

## 🎨 Design System

### **Color Palette**
```dart
// Primary Colors
primary: Color(0xFF6366F1),      // Modern indigo
secondary: Color(0xFF10B981),    // Emerald
tertiary: Color(0xFFF59E0B),     // Amber

// Surface Colors
surface: Color(0xFFFAFAFA),      // Clean white
surfaceVariant: Color(0xFFF1F5F9), // Light gray
```

### **Typography Scale**
- **Display Large**: 57px - For hero sections
- **Display Medium**: 45px - For major headings
- **Headline Large**: 32px - For section headers
- **Title Large**: 22px - For card titles
- **Body Large**: 16px - For primary content
- **Label Large**: 14px - For UI elements

### **Component Library**
- **Modern Cards**: Gradient backgrounds with elevation
- **Interactive Buttons**: Hover effects and animations
- **Status Indicators**: Color-coded badges with icons
- **Navigation**: Smooth drawer with professional styling

## 🔧 Configuration

### **Environment Setup**
Create a `.env` file in the root directory:
```env
APP_NAME=Time Tracker Pro
APP_VERSION=1.0.0
DATABASE_VERSION=1
ENABLE_ANALYTICS=true
```

### **Build Configurations**
```bash
# Development build
flutter build apk --debug

# Production build
flutter build apk --release
flutter build ios --release
flutter build web --release
```

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### **Development Workflow**
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### **Code Standards**
- Follow [Flutter Style Guide](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo)
- Write comprehensive tests
- Update documentation
- Use meaningful commit messages

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Flutter Team** for the amazing framework
- **Material Design Team** for the design system
- **Community Contributors** for their valuable feedback
- **Open Source Libraries** that made this possible

## 📞 Support

If you have any questions, feel free to reach out:

- **Issues**: [GitHub Issues](https://github.com/your-username/time-tracker-pro/issues)
- **Discussions**: [GitHub Discussions](https://github.com/your-username/time-tracker-pro/discussions)
- **Email**: support@timetrackerpro.com

---

<div align="center">
  <p><strong>Built with ❤️ using Flutter</strong></p>
  <p>
    <a href="#features">Features</a> •
    <a href="#installation">Installation</a> •
    <a href="#architecture">Architecture</a> •
    <a href="#contributing">Contributing</a>
  </p>
</div>
