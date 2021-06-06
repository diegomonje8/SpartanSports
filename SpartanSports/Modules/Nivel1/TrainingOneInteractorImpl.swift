// TrainingOneInteractor.swift
// Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

typealias TrainingOneInteractorCompletion = (ResponseArray<ArrayDiccionariosNivel, NetworkingError>) -> ()

protocol TrainingOneInteractorProtocol {
    func fetchTraining(completion: @escaping TrainingOneInteractorCompletion)
}

class TrainingOneInteractorImpl: BaseInteractor<TrainingOnePresenterProtocol> {
    
    var provider: TrainingOneProviderProtocol = TrainingOneProviderImpl()
    
    internal func fetchMenuFromProvider(completion: @escaping TrainingOneInteractorCompletion) {
        self.provider.fetchOneTraining { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let response):
                CoreDataStack.shared.setData(data: response.localPlist?.arrayDiccionariosNivel1 ?? [], type: .menu)
                completion(.success(response.localPlist?.arrayDiccionariosNivel1))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}

extension TrainingOneInteractorImpl: TrainingOneInteractorProtocol {
    internal func fetchTraining(completion: @escaping TrainingOneInteractorCompletion) {
        CoreDataStack.shared.loadDataIfNeeded { isRefreshingRequired in
            if isRefreshingRequired {
                fetchMenuFromProvider(completion: completion)
            } else {
                let result = CoreDataStack.shared.getData(type: ArrayDiccionariosNivel.self)
                if result.isEmpty {
                    fetchMenuFromProvider(completion: completion)
                }
                else {
                    completion(.success(result))
                }
            }
        }
    }
    
    
}
