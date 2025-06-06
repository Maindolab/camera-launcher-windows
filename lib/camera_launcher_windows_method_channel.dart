import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'camera_launcher_windows_platform_interface.dart';

/// An implementation of [CameraLauncherWindowsPlatform] that uses method channels.
class MethodChannelCameraLauncherWindows extends CameraLauncherWindowsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('camera_launcher_windows');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> launchCamera() async {
    await methodChannel.invokeMethod('launchCamera');
  }
}
