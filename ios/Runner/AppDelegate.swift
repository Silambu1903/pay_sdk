import UIKit
import Flutter
import iframe

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate,IFrameContext {

    func callback(response: String) {
        print("Success")
        responseToFlutter!(response)
    }

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

   let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
   let METHOD_CHANEL_NAME = "mediumExplain/battery"
   let batteryChannel = FlutterMethodChannel(name: METHOD_CHANEL_NAME, binaryMessenger: controller.binaryMessenger)

         batteryChannel.setMethodCallHandler ({
              (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
              switch call.method{
              case "getAndroid1":
                 let payUrl = call.arguments as! String

                  //assigning the Flutter result to local variable for callback.
                  self.responseToFlutter = result
                  //Load the payment screen
                  self.loadNativeView()
                  break
              default:
                  result(FlutterMethodNotImplemented)
              }
          })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func loadNativeView(){
          let payController = PayController(iframeContext: self)
          payController.executePayment(uri: "https://aks-pay-qa.hospitalityrevolution.com/pay-iframe-service/v1/iFrame/tenants/0/63497b6d4b508f23c8d15e3f?apiToken=f60bc8bd-9486-4bd8-b906-f864fbad1902&submit=Pay&style=https://authorize.rguest.com/AuthorizeStyles/Authorize_Style.css&doVerify=false&version=3&payToken=a63b34249a31423cb75f8e73ff72dc10&language=&transactionType=sale")
      }
}
