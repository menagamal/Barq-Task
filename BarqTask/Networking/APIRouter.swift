import Foundation
enum APIRouter: URLRequestConvertible{
    
    //MARK:- Videos
    case getAllVideos
    
    //MARK:- HTTPMETHOD
    private var method : HTTPMethod{
        switch self {
        case .getAllVideos:
            return .get
            
        default:
            return .post
            
        }
    }
    //MARK:- PATH
    private var path:String{
        switch self {
            
        case .getAllVideos :
            return "task.json"
        }
    }
    //MARK:- ENCODING
    internal var encoding : ParameterEncoding{
        switch method {
        case .post,.put:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    internal var Auth : Bool{
        switch self {
        case .getAllVideos:
            return false
        default:
            return true
        }
    }
    internal var showIndicator : Bool{
        switch self {
        default:
            return true
        }
    }
    
    //MARK:- ENCODING
    
    private var parameters:[String:Any]?{
        switch self {
        default:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let base = try Constants.Server.baseURL.asURL()
        //var urlRequest = URLRequest(url: url.appendingPathComponent(path)) //OPTIONAL
        print(path)
        var urlRequest: URLRequest!
        if let encoded = "\(base)\(path)".addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),let url = URL(string: encoded) {
            urlRequest = URLRequest(url: url)
        }
        
        
        
        //HTTP METHOD
        urlRequest.httpMethod = method.rawValue
        
        //HEADER
        
        
        //PARAMETERS
        if let parameters = parameters{
            do{
                print("Parameters \(parameters)")
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch{
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        //DEBUG DESCRIPTION
        print("Headers \(urlRequest.allHTTPHeaderFields)")
        print("Request URL \(urlRequest.url)")
        print("Parameters \(urlRequest.httpBody)")
        print("Method \(urlRequest.httpMethod)")
        
        return try! encoding.encode(urlRequest, with: parameters)
    }
}
