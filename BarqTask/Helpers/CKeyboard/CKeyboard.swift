import Foundation
import IQKeyboardManagerSwift
public class CKeyboard{
    public class func ActiveIQKeyboardManager(){
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
}
