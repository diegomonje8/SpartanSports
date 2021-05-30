//
//  SplashProvider.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import Foundation
import Combine

typealias SplashProviderCompletion = (Result<ResponseMenuModel,ApiError>) -> ()

protocol SplashProviderProtcol {
    func fetchMenu(conpletionHandler: @escaping SplashProviderCompletion)
}

class SplashProviderImpl : SplashProviderProtcol {
     
    let provider : RequestManagerProtocol = RequestManager()
    var cancellable: Set<AnyCancellable> = []
    
    internal func fetchMenu(conpletionHandler: @escaping SplashProviderCompletion) {
        let requestDTO = RequestDTO(params: nil, method: .get, endpoint: URLEndpoint.endpointMenu)
        provider.requestGeneric(requestDTO: requestDTO, entityClass: ResponseMenuModel.self).sink { [weak self] completion in
            guard self != nil else { return }
            switch completion {
            case .finished: break
            case .failure(let error): conpletionHandler(.failure(error))
            }
        } receiveValue: {  [weak self] ResponseMenuModel in
            guard self != nil else { return }
            conpletionHandler(.success(ResponseMenuModel))
        }
        .store(in: &cancellable)
    }
    
}

