import 'package:flutter_test/flutter_test.dart';
import 'package:camera_launcher_windows/camera_launcher_windows.dart';
import 'package:camera_launcher_windows/camera_launcher_windows_platform_interface.dart';
import 'package:camera_launcher_windows/camera_launcher_windows_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCameraLauncherWindowsPlatform
    with MockPlatformInterfaceMixin
    implements CameraLauncherWindowsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> launchCamera() async {}
}

void main() {
  final CameraLauncherWindowsPlatform initialPlatform = CameraLauncherWindowsPlatform.instance;

  test('$MethodChannelCameraLauncherWindows is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCameraLauncherWindows>());
  });

  test('getPlatformVersion', () async {
    CameraLauncherWindows cameraLauncherWindowsPlugin = CameraLauncherWindows();
    MockCameraLauncherWindowsPlatform fakePlatform = MockCameraLauncherWindowsPlatform();
    CameraLauncherWindowsPlatform.instance = fakePlatform;

    expect(await cameraLauncherWindowsPlugin.getPlatformVersion(), '42');
  });

  test('launchCamera', () async {
    CameraLauncherWindows cameraLauncherWindowsPlugin = CameraLauncherWindows();
    MockCameraLauncherWindowsPlatform fakePlatform = MockCameraLauncherWindowsPlatform();
    CameraLauncherWindowsPlatform.instance = fakePlatform;

    await expectLater(cameraLauncherWindowsPlugin.launchCamera(), completes);
  });
}
