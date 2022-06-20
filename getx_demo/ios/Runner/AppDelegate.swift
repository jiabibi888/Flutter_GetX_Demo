import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    let registrar:FlutterPluginRegistrar = self.registrar(forPlugin: "plugins.flutter.io/custom_platform_view_plugin")!
    let factory = MyFlutterViewFactory(messenger: registrar.messenger())
    registrar.register(factory, withId: "plugins.flutter.io/custom_platform_view")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
