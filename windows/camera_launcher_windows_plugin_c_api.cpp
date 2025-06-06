#include "include/camera_launcher_windows/camera_launcher_windows_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "camera_launcher_windows_plugin.h"

void CameraLauncherWindowsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  camera_launcher_windows::CameraLauncherWindowsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
