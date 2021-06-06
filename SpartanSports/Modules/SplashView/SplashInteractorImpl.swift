//
//  SplashInteractorImpl.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import Foundation


typealias SplashInteractorCompletion = (ResponseArray<MenuResponse, NetworkingError>) -> ()

protocol SplashInteractorProtocol {
    func fetchMenu(completion: @escaping SplashInteractorCompletion)
}

class SplashInteractorImpl : BaseInteractor<SplashPresenterProtocol> {
    var provider : SplashProviderProtcol = SplashProviderImpl()
    
    internal func fetchMenuFromProvider(completion: @escaping SplashInteractorCompletion) {
        self.provider.fetchMenu { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let response):
                CoreDataStack.shared.setData(data: response.menuResponse ?? [], type: .menu)
                completion(.success(response.menuResponse))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
    
}

extension SplashInteractorImpl : SplashInteractorProtocol {
    
    
    internal func fetchMenu(completion: @escaping SplashInteractorCompletion) {
        
        CoreDataStack.shared.loadDataIfNeeded { isRefreshingRequired in
            if isRefreshingRequired {
                fetchMenuFromProvider(completion: completion)
            } else {
                let result = CoreDataStack.shared.getData(type: MenuResponse.self)
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
