class PushNotificationsHelper {
    
    enum NotificationType: String {
        case Alert = "alert"
        
    }
    
    
    static let shared: PushNotificationsHelper = PushNotificationsHelper()
    
    private init () {}
    
    
    func didReceive(payload: [AnyHashable: Any]) {
        let type = notificationType(payload: payload)
        let message = title(alert: alert(payload: payload))
        //openMessage(message: message, type: type.rawValue)
    }
    
    /// Take payload as parameters and return notification type bases on `NotificationTypes`
    
    private func notificationType(payload: [AnyHashable: Any]) -> NotificationType {
        if let orderType = payload["type"] as? String {
            switch orderType {
                
            default:
                return .Alert
            }
        }
        return .Alert
    }
    
    // MARK: - Notification PayLoad
    
    /// get alert
    private func alert(payload: [AnyHashable: Any]) -> [String: String] {
        if let aps = payload["aps"]  as? [String: Any]{
            if let alert = aps["alert"] as? [String: String] {
                return alert
            }
        }
        return ["":""]
    }
    /// get title
    private func title(alert: [String: String]) -> String {
        
        if let title = alert["title"] as? String {
            return title
        }
        return ""
    }
    /// get body
    private func body(alert: [String: String]) -> String {
        if let body = alert["body"] as? String {
            return body
        }
        return ""
    }
    
//    // MARK: - Navitaion
//    private func openMessage(message:String,type: String) {
//        
//        UserDefaults.standard.set(message, forKey: "message")
//        NotificationCenter.default.post(name: .onNotificationRecieved, object: nil)
//    }
    
}
