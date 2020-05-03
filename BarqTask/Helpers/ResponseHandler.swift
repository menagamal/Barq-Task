import Foundation
import UIKit
class ResponseHandler{
  class func handleResponse<T:Codable>(response:Server_Response<T>?,error:Error?)->(data:T?,success:Bool){
    
    if let error = error{
      ResponseHandler.showError(error: error.localizedDescription)
      return (nil,false)
    }
    else  if let response = response{
      if let code = response.code{
        if code == 200{
          if let data = response.data{
            return (data,true)
          }
          else{
            return (nil,true)
          }
        }
        else{
          if let message = response.message{
            if message.count > 0{
            ResponseHandler.showError(error: message)
            }
            else if let errors = response.errors{
              if errors.count > 0{
                  ResponseHandler.showError(error: errors[0])
              }
            }
          }
         else if let errors = response.errors{
            if errors.count > 0{
                ResponseHandler.showError(error: errors[0])
            }
          }
          else if let message = response.data as? String{
              ResponseHandler.showError(error: message)
          }
          return (nil,false)
        }
      }
    }
    return (nil,false)
  }
  class func showError(error:String){
    guard let keyWindow = UIApplication.shared.keyWindow else { return }
    var alert = UIAlertController()
    let ok = UIAlertAction(title: NSLocalizedString("ok", comment: "ok"), style: .default) { (action) in
    }
    alert = UIAlertController(title: nil, message: error, preferredStyle: .alert)
    alert.addAction(ok)
    keyWindow.rootViewController!.present(alert,animated: true)
  }
    
}
