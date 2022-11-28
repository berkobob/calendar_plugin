import Flutter
import UIKit

public class SwiftCalendarPlugin: NSObject, FlutterPlugin {

  let calendar = MyCalendar()

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "calendar_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftCalendarPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "getPlatformVersion":
        result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
      case "getDefaultCalendar":
        result(self.calendar.getDefaultCalendar())
      case "saveEvent":
        if let args = call.arguments as? [String: Any] {
          self.calendar.saveEvent(args) { (ok) in 
            result(ok)
          }
        }
      default:
        result(FlutterMethodNotImplemented)
    }
  }
}
