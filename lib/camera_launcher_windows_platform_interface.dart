import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'camera_launcher_windows_method_channel.dart';

abstract class CameraLauncherWindowsPlatform extends PlatformInterface {
  /// Constructs a CameraLauncherWindowsPlatform.
  CameraLauncherWindowsPlatform() : super(token: _token);

  static final Object _token = Object();

  static CameraLauncherWindowsPlatform _instance = MethodChannelCameraLauncherWindows();

  /// The default instance of [CameraLauncherWindowsPlatform] to use.
  ///
  /// Defaults to [MethodChannelCameraLauncherWindows].
  static CameraLauncherWindowsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CameraLauncherWindowsPlatform] when
  /// they register themselves.
  static set instance(CameraLauncherWindowsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> launchCamera() {
    throw UnimplementedError('launchCamera() has not been implemented.');
  }
}
