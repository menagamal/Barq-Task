import Foundation
struct Server_Response <T: Decodable>: Decodable {
    let status : String?
    let message : String?
    let code : Int?
    let errors : [String]?
    let success : String?
    let data : T?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case message = "message"
        case code = "code"
        case errors = "errors"
        case success = "success"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        errors = try values.decodeIfPresent([String].self, forKey: .errors)
        success = try values.decodeIfPresent(String.self, forKey: .success)
        data = try values.decodeIfPresent(T.self, forKey: .data)
        
        
    }
    
}
