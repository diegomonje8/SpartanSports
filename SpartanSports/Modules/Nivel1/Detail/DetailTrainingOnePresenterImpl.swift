//
//  DetailTrainingOnePresenterImpl.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import Foundation

protocol DetailTrainingOnePresenterProtocol {
    func getData()
}

class DetailTrainingOnePresenterImpl {
    var viewModel : ArrayDiccionariosNivel?
    weak var delegate : TablePresenterDelegate?
    
    internal func updateData() {
        self.delegate?.dataSourceUpdated()
    }
}

extension DetailTrainingOnePresenterImpl : DetailTrainingOnePresenterProtocol {
    internal func getData() {
        updateData()
    }
}

extension DetailTrainingOnePresenterImpl : TablePresenterProtocol {
    func numberOfCell(_ tableType: TableType, section: Int) -> Int {
        return 3
    }
    
    func object(_ tableType: TableType, indexPath: IndexPath) -> Any {
        switch indexPath.row {
        case 0:
            return TrainingModelHeader.init(tituloEjercicio: viewModel?.tituloEjercicio, imagenEjercicio: viewModel?.imagenEjercicio)
        case 1:
            return TrainingModelInfo.init(descripcionEjercicio: viewModel?.descripcionEjercicio)
        default:
            return TrainingModelVideo.init(arrayEjerciciosResponse: viewModel?.arrayEjerciciosResponse)
        }
        
        
    }
    
    func heightForRowAt(_ tableType: TableType, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return 250
        case 1: return UITableView.automaticDimension
        default: return 230
        }
    }
    
    func didTapRow(_ tableType: TableType, indexPath: IndexPath) {
        
    }
    
    
}
