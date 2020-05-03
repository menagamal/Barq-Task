//
//  PushNotification+Appdelegate.swift
//  Azayem
//
//  Created by Trufla on 1/18/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import Firebase
import UserNotifications

// [START ios_10_message_handling]
@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        //let userInfo = notification.request.content.userInfo
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        
        
        // Print full message.
        // Change this to your preferred presentation option
      //when recived
        let userInfo = notification.request.content.userInfo
        print(userInfo)
       
//        handleAPNS(payload: userInfo)
      
      completionHandler([.alert,.badge,.sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        // Print message ID.
        
        
        // Print full message.
        print(userInfo)
      // click
       PushNotificationsHelper.shared.didReceive(payload: userInfo)
//        handleAPNS(payload: userInfo)
        completionHandler()
    }
}
// [END ios_10_message_handling]

extension AppDelegate : MessagingDelegate {
    // [START refresh_token]
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
        UserDefaults.standard.set(fcmToken, forKey: "fcmToken")
    }
    // [END refresh_token]
    // [START ios_10_data_message]
    // Receive data messages on iOS 10+ directly from FCM (bypassing APNs) when the app is in the foreground.
    // To enable direct data messages, you can set Messaging.messaging().shouldEstablishDirectChannel to true.
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        print("Received data message: \(remoteMessage.appData)")
    }
  
    // [END ios_10_data_message]
}

extension AppDelegate {
   // func handleAPNS(payload: [AnyHashable: Any]) {
//      //        if let orderId = payload["id"] as? String, let orderStatus = payload["status"] as? String, let orderNumber = payload["order_number"] as? String {
//      //            UserDefaults.standard.set(orderId, forKey: "ORDERID")
//      //            UserDefaults.standard.set(orderStatus, forKey: "ORDERSTATUS")
//      //            UserDefaults.standard.set(orderNumber, forKey: "ORDERNUMBER")
//      //            NotificationCenter.default.post(name: .onNotificationRecieved, object: nil)
//      //        }
//    }
//    
    func register(_ application: UIApplication) {
        FirebaseApp.configure()
             // [START set_messaging_delegate]
             Messaging.messaging().delegate = self
             // [END set_messaging_delegate]
             // Register for remote notifications. This shows a permission dialog on first run, to
             // show the dialog at a more appropriate time move this registration accordingly.
             // [START register_for_notifications]
             if #available(iOS 10.0, *) {
                 // For iOS 10 display notification (sent via APNS)
                 UNUserNotificationCenter.current().delegate = self
                 let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
                 UNUserNotificationCenter.current().requestAuthorization(
                     options: authOptions,
                     completionHandler: {_, _ in })
             } else {
                 let settings: UIUserNotificationSettings =
                     UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
                 application.registerUserNotificationSettings(settings)
             }
             
             application.registerForRemoteNotifications()
      
             UserDefaults.standard.set(true, forKey: "didFinishLaunching")
    }
}
