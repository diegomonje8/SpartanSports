// MenuInteractor.swift
// Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation


typealias MenuInteractorCompletion = (ResponseArray<ConsejosGenerale, NetworkingError>) -> ()

protocol MenuInteractorProtocol {
    func fecthConsejos(completion: @escaping MenuInteractorCompletion)
}

class MenuInteractorImpl: BaseInteractor<MenuPresenterProtocol> {
    
    var provider: MenuProviderProtocol = MenuProviderImpl()
    
    internal func fetchMenuFromProvider(completion: @escaping MenuInteractorCompletion) {
        self.provider.fetchConsejos { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let response):
                CoreDataStack.shared.setData(data: response.icoResponseConsejos?.consejosGenerales ?? [], type: .consejos)
                completion(.success(response.icoResponseConsejos?.consejosGenerales))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
    
}

extension MenuInteractorImpl: MenuInteractorProtocol {
    
    func fecthConsejos(completion: @escaping MenuInteractorCompletion) {
        
        CoreDataStack.shared.loadDataIfNeeded { isRefreshingRequired in
            if isRefreshingRequired {
                fetchMenuFromProvider(completion: completion)
            } else {
                let result = CoreDataStack.shared.getData(type: ConsejosGenerale.self)
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
