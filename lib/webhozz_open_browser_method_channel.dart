import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'webhozz_open_browser_platform_interface.dart';

/// An implementation of [WebhozzOpenBrowserPlatform] that uses method channels.
class MethodChannelWebhozzOpenBrowser extends WebhozzOpenBrowserPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('webhozz_open_browser');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> webhozzOpenBrowser(String url) async {
    final bool result = await methodChannel.invokeMethod("webhozzOpenBrowser",
    <String, String>{
      "url": url
    });
  }
}
