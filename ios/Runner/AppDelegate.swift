import UIKit
import Flutter
import Firebase
import flutter_downloader
import GoogleMaps


struct Colors {
    static let red = "📕"
    static let green = "📗"
    static let yellow = "📔"
    static let blue = "📘"
    static let orange = "📙"
}

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

    var flutterResult: FlutterResult?


    override func application(  _ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? ) -> Bool {

        FirebaseApp.configure()

        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: { _, _ in }
            )
        } else {
            let settings: UIUserNotificationSettings =  UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }


//        application.registerForRemoteNotifications()
//
//            GeneratedPluginRegistrant.register(with: self)
//              if(FirebaseApp.app() == nil){
//                      FirebaseApp.configure()
//                  }

              FlutterDownloaderPlugin.setPluginRegistrantCallback(registerPlugins)


        Messaging.messaging().token { token, error in
            if let error = error {
                print("Error fetching FCM registration token: \(error)")
            } else if let token = token {
                print("FCM registration token: \(token)")
            }
        }

        /// [ 2 ]
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController

        /// [ 3 ]
        let fingerPrintChannel = FlutterMethodChannel(
            name: "com.fnrco.fingerprint/channel",
            binaryMessenger: controller.binaryMessenger
        )

        /// [ 4 ]
        fingerPrintChannel.setMethodCallHandler({[weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in self!.flutterResult = result

            if call.method == "say_hello" {
                let arg = call.arguments as? [String: Any]

                print(arg)

                print("Say Hello")

            } else if call.method == "reply_hello"{
                let arg = call.arguments as? [String: Any]

                print(arg)

                print("Reply Hello")

            }else{
                result(FlutterError(code: "1", message: "Method name is not found", details: ""))
            }

        })


        GeneratedPluginRegistrant.register(with: self)

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }


    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().setAPNSToken(deviceToken, type: MessagingAPNSTokenType.sandbox)
        Messaging.messaging().apnsToken = deviceToken
        Messaging.messaging().token { token, error in if let error = error {
            print("Error FCM token: \(error)")
        } else if let token = token {
            print(Colors.green + "Success FCM token:\(Colors.green) \(token)")
        }
        }
        super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }


}


private func registerPlugins(registry: FlutterPluginRegistry) {
    if (!registry.hasPlugin("FlutterDownloaderPlugin")) {
       FlutterDownloaderPlugin.register(with: registry.registrar(forPlugin: "FlutterDownloaderPlugin")!)
    }
}

//@UIApplicationMain
//@objc class AppDelegate: FlutterAppDelegate {
//  override func application(
//    _ application: UIApplication,
//    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//  ) -> Bool {
//
//    GMSServices.provideAPIKey("AIzaSyAL5fpg6ptmwGRWlGTC9kI6_dqxuKqChZc")
//    GeneratedPluginRegistrant.register(with: self)
//      if(FirebaseApp.app() == nil){
//              FirebaseApp.configure()
//          }
//
//      FlutterDownloaderPlugin.setPluginRegistrantCallback(registerPlugins)
//
//    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//  }
//}
//private func registerPlugins(registry: FlutterPluginRegistry) {
//    if (!registry.hasPlugin("FlutterDownloaderPlugin")) {
//       FlutterDownloaderPlugin.register(with: registry.registrar(forPlugin: "FlutterDownloaderPlugin")!)
//    }
//}
