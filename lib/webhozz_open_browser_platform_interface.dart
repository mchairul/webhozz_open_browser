import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'webhozz_open_browser_method_channel.dart';

abstract class WebhozzOpenBrowserPlatform extends PlatformInterface {
  /// Constructs a WebhozzOpenBrowserPlatform.
  WebhozzOpenBrowserPlatform() : super(token: _token);

  static final Object _token = Object();

  static WebhozzOpenBrowserPlatform _instance = MethodChannelWebhozzOpenBrowser();

  /// The default instance of [WebhozzOpenBrowserPlatform] to use.
  ///
  /// Defaults to [MethodChannelWebhozzOpenBrowser].
  static WebhozzOpenBrowserPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WebhozzOpenBrowserPlatform] when
  /// they register themselves.
  static set instance(WebhozzOpenBrowserPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> webhozzOpenBrowser(String url) {
    throw UnimplementedError('webhozzOpenBrowser() has not been implemented.');
  }
}
