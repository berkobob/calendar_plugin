import 'calendar_plugin_platform_interface.dart';

class CalendarPlugin {
  Future<String?> getPlatformVersion() {
    return CalendarPluginPlatform.instance.getPlatformVersion();
  }

  Future<String?> getDefaultCalendar() {
    return CalendarPluginPlatform.instance.getDefaultCalendar();
  }

  Future<bool?> saveEvent(Map event) {
    final success = CalendarPluginPlatform.instance.saveEvent(event);
    return success;
  }
}
