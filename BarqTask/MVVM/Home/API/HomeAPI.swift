//
//  HomeAPI.swift
//  BarqTask
//
//  Created by Mena Gamal on 5/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

protocol HomeRepo {
    func getAllVideos(completion: @escaping (ServerResponse<HomeJsonResponse>) -> ())
}

class HomeService: HomeRepo{
    
    func getAllVideos(completion: @escaping (ServerResponse<HomeJsonResponse>) -> ()) {
        APIClient.getAllVideos { (response: Server_Response<HomeJsonResponse>?, error: Error?) in
            let (data,_) = ResponseHandler.handleResponse(response: response, error: error)
            if let data = data{
                completion(.success(data))
            }   else {
                completion(.failure(error))
            }
        }
    }
    
    
}
