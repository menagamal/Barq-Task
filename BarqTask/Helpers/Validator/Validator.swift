import Foundation
import UIKit
class Validator{
  func isValidEmail(value:String?)->Bool{
    guard let value = value else{
      self.showError(error: NSLocalizedString("emailvalidation", comment: "Email Address isn't in correct format"))
      return false
    }
    do {
      //[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}
      if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
        self.showError(error: NSLocalizedString("emailvalidation", comment: "Email Address isn't in correct format"))
        return false
      }
    } catch {
      return false
    }
    return true
  }
  func isNotEmpty(value:String?,placeHolderKey:String)->Bool{
    guard let value = value else{
      self.showError(error: "\(NSLocalizedString(placeHolderKey, comment: placeHolderKey)) \(NSLocalizedString("required", comment: " is required"))")
      return false
    }
    if value.isEmpty && value.trimmingCharacters(in: .whitespaces).isEmpty{
      self.showError(error: "\(NSLocalizedString(placeHolderKey, comment: placeHolderKey)) \(NSLocalizedString("required", comment: " is required"))")
      return false
    }
    return true
  }
  func isNotEmpty(value:String)->Bool{
    if value.isEmpty && value.trimmingCharacters(in: .whitespaces).isEmpty{
      self.showError(error: NSLocalizedString("all_fields_required", comment: "all_fields_required"))
      return false
    }
    return true
  }
  func isValidPasswordAndConfirmPassword(password:String,confirmPassword:String)->Bool{
    if password != confirmPassword{
      self.showError(error: NSLocalizedString("password_mismatch", comment: "password_mismatch"))
      return false
    }
    return true
  }
  private func showError(error:String){
    guard let keyWindow = UIApplication.shared.keyWindow else { return }
    var alert = UIAlertController()
    let ok = UIAlertAction(title: NSLocalizedString("ok", comment: "ok"), style: .default) { (action) in
    }
    alert = UIAlertController(title: nil, message: error, preferredStyle: .alert)
    alert.addAction(ok)
    keyWindow.rootViewController!.present(alert,animated: true)
  }
}
