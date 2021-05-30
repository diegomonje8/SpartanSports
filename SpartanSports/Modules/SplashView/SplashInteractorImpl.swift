//
//  SplashInteractorImpl.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import Foundation


typealias SplashInteractorCompletion = (ResponseArray<MenuResponse, ApiError>) -> ()

protocol SplashInteractorProtocol {
    func fetchMenu(completion: @escaping SplashInteractorCompletion)
}

class SplashInteractorImpl : BaseInteractor<SplashPresenterProtocol> {
    var provider : SplashProviderProtcol = SplashProviderImpl()
}

extension SplashInteractorImpl : SplashInteractorProtocol {
    
    internal func fetchMenu(completion: @escaping SplashInteractorCompletion) {
        self.provider.fetchMenu { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let response): completion(.success(response.menuResponse))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
    
}
