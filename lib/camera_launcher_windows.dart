
import 'camera_launcher_windows_platform_interface.dart';

class CameraLauncherWindows {
  Future<String?> getPlatformVersion() {
    return CameraLauncherWindowsPlatform.instance.getPlatformVersion();
  }

  Future<void> launchCamera() {
    return CameraLauncherWindowsPlatform.instance.launchCamera();
  }
}
