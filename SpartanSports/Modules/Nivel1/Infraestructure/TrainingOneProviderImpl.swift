// TrainingOneProvider.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation
import Combine

protocol TrainingOneProviderProtocol {
    func fetchOneTraining(completionHandler: @escaping (Result<EntrenamientosResponseModel, NetworkingError>) -> ())
}

class TrainingOneProviderImpl: TrainingOneProviderProtocol {

    let provider: RequestManagerProtocol = RequestManager()
    
    
    var cancellable: Set<AnyCancellable> = []
    
    internal func fetchOneTraining(completionHandler: @escaping (Result<EntrenamientosResponseModel, NetworkingError>) -> ()) {
        
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.endpointNivel1)
        
        self.provider.requestGeneric(requestDTO: request, entityClass: EntrenamientosResponseModel.self)
            .sink { [weak self] (completion) in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    completionHandler(.failure(error))
                }
        } receiveValue: { [weak self] responseTrainingModel in
            guard self != nil else { return }
            completionHandler(.success(responseTrainingModel))
        }.store(in: &cancellable)
    }
    
}


