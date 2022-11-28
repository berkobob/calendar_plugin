import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'calendar_plugin_platform_interface.dart';

/// An implementation of [CalendarPluginPlatform] that uses method channels.
class MethodChannelCalendarPlugin extends CalendarPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('calendar_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getDefaultCalendar() async {
    final title =
        await methodChannel.invokeMethod<String>('getDefaultCalendar');
    return title;
  }

  @override
  Future<bool?> saveEvent(Map event) async {
    final ok = await methodChannel.invokeMethod<bool>('saveEvent', event);
    return ok;
  }
}
