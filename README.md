# 📸 camera_launcher_windows

A simple Flutter plugin to launch the native **Windows Camera** app directly from your Flutter app.

> ⚠️ **Platform support:** Windows only  
> 🚀 Perfect for desktop apps that need to open the camera quickly and natively.

---

## ✨ Features

- 🚀 Launch the built-in **Windows Camera** app with a single command.
- 🧑‍💻 Easy to use — no complex setup required.
- ⚙️ Lightweight and native.

---

## 🛠 Installation

Add the plugin to your `pubspec.yaml`:

```yaml
dependencies:
  camera_launcher_windows: ^0.1.0
```

---

## 🧑‍🏫 Full Example

Here's a minimal example you can paste directly into your `main.dart` to test the plugin:

```dart
import 'package:flutter/material.dart';
import 'package:camera_launcher_windows/camera_launcher_windows.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Launcher Demo',
      home: const CameraHomePage(),
    );
  }
}

class CameraHomePage extends StatelessWidget {
  const CameraHomePage({super.key});

  Future<void> _openCamera() async {
    try {
      await CameraLauncherWindows.launchCamera();
    } catch (e) {
      debugPrint('Failed to launch camera: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera Launcher')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: _openCamera,
          icon: const Icon(Icons.camera_alt),
          label: const Text('Open Camera'),
        ),
      ),
    );
  }
}
```