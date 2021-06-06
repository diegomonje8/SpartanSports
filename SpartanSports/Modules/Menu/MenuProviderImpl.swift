// MenuProvider.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation
import Combine

typealias MenuProviderCompletion = (Result<ResponseConsejosModel,NetworkingError>) -> ()

protocol MenuProviderProtocol {
    func fetchConsejos(completionHandler: @escaping MenuProviderCompletion)
}

class MenuProviderImpl: MenuProviderProtocol {

    let provider: RequestManagerProtocol = RequestManager()
    
    var cancellable: Set<AnyCancellable> = []
    
    internal func fetchConsejos(completionHandler: @escaping MenuProviderCompletion) {
        
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.endpointMenu)
        
        self.provider.requestGeneric(requestDTO: request, entityClass: ResponseConsejosModel.self)
            .sink { [weak self] (completion) in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    completionHandler(.failure(error))
                }
        } receiveValue: { [weak self] responseMenuModel in
            guard self != nil else { return }
            completionHandler(.success(responseMenuModel))
        }.store(in: &cancellable)
    }
    
}


