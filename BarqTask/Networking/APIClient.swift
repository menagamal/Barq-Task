import Foundation
import UIKit
class APIClient {
    @discardableResult
    
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Server_Response<T>?,Error?)->Void) -> DataRequest {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let ActivityIndicator = CActivityIndicator()
        if route.showIndicator{
            ActivityIndicator.start()
        }
        return request(route).responseData(completionHandler: { (response) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            ActivityIndicator.stop()
            switch response.result{
            case .success(let value):
                let res = String(data: value, encoding: .utf8)
                print(res ?? "")
                print(JSON(value))
                do{
                    let DataResponsed = try JSONDecoder().decode(Server_Response<T>.self, from: value)
                    completion(DataResponsed,nil)
                }
                catch{
                    print("API ROUTE: \(route.urlRequest?.url?.absoluteString)")
                    print("ERROR -> IN DECODE")
                    print(error)
                    print(res)
                    
                    print(error.localizedDescription)
                    let e = NSError(domain:error.localizedDescription, code:response.response?.statusCode ?? 0, userInfo:nil)
                    completion(nil,e)
                }
            case .failure(let error):
                
                print(error)
                let e = NSError(domain:error.localizedDescription, code:response.response?.statusCode ?? 0, userInfo:nil)
                completion(nil,e)
            }
        }
        ) }
    
    
    
    static func getAllVideos<T:Decodable>(completion:@escaping (Server_Response<T>?,Error?)->Void) {
           performRequest(route: APIRouter.getAllVideos, completion: completion)
       }
    static func sendRequest<T:Decodable>(router: APIRouter,completion:@escaping (Server_Response<T>?,Error?)->Void) {
        performRequest(route: router, completion: completion)
    }
    
}

