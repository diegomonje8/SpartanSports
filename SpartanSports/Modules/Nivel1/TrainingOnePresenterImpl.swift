// TrainingOnePresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol TrainingOnePresenterProtocol {
    func fetchTraining()
    func getNumberOfRowsInSection() -> Int
    func getInformationObject(indexPath: Int) -> ArrayDiccionariosNivel
}

class TrainingOnePresenterImpl: BasePresenter<TrainingOneViewControllerProtocol, TrainingOneRouterProtocol> {
    
    var interactor: TrainingOneInteractorProtocol?
    var viewModel: [ArrayDiccionariosNivel] = []
    
    
}


extension TrainingOnePresenterImpl: TrainingOnePresenterProtocol {
    internal func fetchTraining() {
        self.interactor?.fetchTraining(completion: { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let response):
                if let response = response {
                    self?.viewModel.removeAll()
                    self?.viewModel = response
                    self?.viewController?.fetchhDataFromPresent()
                }
                else {print("No data in Menu")}
            case .failure(let error):
                print ("Error \(error?.localizedDescription ?? "Error")")
            }
        })
    }
    
    internal func getNumberOfRowsInSection() -> Int {
        viewModel.count
    }
    
    internal func getInformationObject(indexPath: Int) -> ArrayDiccionariosNivel {
        viewModel[indexPath]
    }
    
  
}
