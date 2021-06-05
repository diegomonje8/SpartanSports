//
//  RequestManager.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import Foundation
import Combine

protocol RequestManagerProtocol: AnyObject {
    
    func requestGeneric<T: Decodable>(requestDTO: RequestDTO, entityClass: T.Type) -> AnyPublisher<T,NetworkingError>
    
}

class RequestManager: RequestManagerProtocol {
    
    internal func requestGeneric<T>(requestDTO: RequestDTO, entityClass: T.Type) -> AnyPublisher<T, NetworkingError> where T : Decodable {
        
        let endpoint = requestDTO.endpoint
        var urlRequest = URLRequest(url: URL(string: endpoint)!)
        let headers = RequestHeaders.defaultHTTPHeaders
        
        headers.forEach { (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .mapError { (error) -> NetworkingError in
                NetworkingError(error: error)
            }
            .flatMap { data, response -> AnyPublisher<T, NetworkingError> in
                guard let httpResponse = response as? HTTPURLResponse else {
                    return Fail(error: NetworkingError(status: .badRequest)).eraseToAnyPublisher()
                }
                if (200...299).contains(httpResponse.statusCode) {
                    return Just(data)
                        .decode(type: T.self, decoder: JSONDecoder())
                        .mapError { error in
                            NetworkingError(status: .accepted)
                        }
                        .eraseToAnyPublisher()
                }
                else {
                    let error = NetworkingError(errorCode: httpResponse.statusCode)
                    return Fail(error: NetworkingError(error: error)).eraseToAnyPublisher()
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
