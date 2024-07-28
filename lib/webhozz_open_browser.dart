
import 'webhozz_open_browser_platform_interface.dart';

class WebhozzOpenBrowser {
  Future<String?> getPlatformVersion() {
    return WebhozzOpenBrowserPlatform.instance.getPlatformVersion();
  }

  Future<void> webhozzOpenBrowser(String url) {
    return WebhozzOpenBrowserPlatform.instance.webhozzOpenBrowser(url);
  }
}
