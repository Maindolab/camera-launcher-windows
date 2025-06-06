#include "camera_launcher_windows_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

// For getPlatformVersion; remove unless needed for your plugin implementation.
#include <VersionHelpers.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <memory>
#include <sstream>

namespace camera_launcher_windows {

  // static
  void CameraLauncherWindowsPlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarWindows *registrar
  ) {
    auto channel = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
      registrar->messenger(), 
      "camera_launcher_windows",
      &flutter::StandardMethodCodec::GetInstance()
    );

    auto plugin = std::make_unique<CameraLauncherWindowsPlugin>();

    channel->SetMethodCallHandler(
      [plugin_pointer = plugin.get()](const auto &call, auto result) {
        plugin_pointer->HandleMethodCall(call, std::move(result));
      }
    );

    registrar->AddPlugin(std::move(plugin));
  }

  CameraLauncherWindowsPlugin::CameraLauncherWindowsPlugin() {}

  CameraLauncherWindowsPlugin::~CameraLauncherWindowsPlugin() {}

  /// Launches the camera application on Windows.
  void LaunchCamera() {
    ShellExecuteW(
      nullptr,
      L"open",
      L"microsoft.windows.camera:",
      nullptr,
      nullptr,
      SW_SHOWNORMAL
    );
  }

  void CameraLauncherWindowsPlugin::HandleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue> &method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result
  ) {
    if (method_call.method_name().compare("getPlatformVersion") == 0) {
      std::ostringstream version_stream;
      version_stream << "Windows ";
      if (IsWindows10OrGreater()) {
        version_stream << "10+";
      } else if (IsWindows8OrGreater()) {
        version_stream << "8";
      } else if (IsWindows7OrGreater()) {
        version_stream << "7";
      }
      result->Success(flutter::EncodableValue(version_stream.str()));
    } else if (method_call.method_name().compare("launchCamera") == 0) {
      LaunchCamera();
      result->Success(flutter::EncodableValue(true));
    } else {
      result->NotImplemented();
    }
  }
}
