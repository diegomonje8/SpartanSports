//
//  RequestManager.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import Foundation
import Combine

protocol RequestManagerProtocol: AnyObject {
    
    func requestGeneric<T: Decodable>(requestDTO: RequestDTO, entityClass: T.Type) -> AnyPublisher<T,ApiError>
    
}

class RequestManager: RequestManagerProtocol {
    
    internal func requestGeneric<T>(requestDTO: RequestDTO, entityClass: T.Type) -> AnyPublisher<T, ApiError> where T : Decodable {
        
        let endpoint = requestDTO.endpoint
        var urlRequest = URLRequest(url: URL(string: endpoint)!)
        let headers = RequestHeaders.defaultHTTPHeaders
        
        headers.forEach { (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .mapError { (error) -> ApiError in
                ApiError.unknown
            }
            .flatMap { data, response -> AnyPublisher<T, ApiError> in
                guard let httpResponse = response as? HTTPURLResponse else {
                    return Fail(error: ApiError.unknown).eraseToAnyPublisher()
                }
                if (200...299).contains(httpResponse.statusCode) {
                    return Just(data)
                        .decode(type: T.self, decoder: JSONDecoder())
                        .mapError { error in
                            ApiError.unknown
                        }
                        .eraseToAnyPublisher()
                }
                else if (httpResponse.statusCode == 404) {
                    let error = ApiError.apiError(reason: "URL Not found")
                    return Fail(error: error).eraseToAnyPublisher()
                }
                else {
                    let error = ApiError.unknown
                    return Fail(error: error).eraseToAnyPublisher()
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
