import Foundation
public class Language {
    public class func currentLanguage() ->String{
        let def = UserDefaults.standard
        let languages = def.object(forKey: "AppleLanguages") as! NSArray
        let currentLang = languages.firstObject as! String
        return currentLang
    }
   public class func setLanguage(lang: String){
        let def = UserDefaults.standard
        def.set([lang, currentLanguage()], forKey: "AppleLanguages")
        def.synchronize()
    }
}
