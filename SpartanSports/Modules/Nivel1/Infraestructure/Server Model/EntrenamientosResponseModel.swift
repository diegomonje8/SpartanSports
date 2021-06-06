//
//  EntrenamientosResponseModel.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import Foundation


import Foundation

// MARK: - EntrenamientosResponseModel
struct EntrenamientosResponseModel: Codable {
    let localPlist: LocalPlist?
    
    enum CodingKeys: String, CodingKey {
        case localPlist
    }
}



// MARK: - LocalPlist
struct LocalPlist: Codable {
    let arrayDiccionariosNivel1: [ArrayDiccionariosNivel]?
    let arrayDiccionariosNivel2: [ArrayDiccionariosNivel]?
    let arrayDiccionariosNivel3: [ArrayDiccionariosNivel]?
    let arrayDiccionariosNivel4: [ArrayDiccionariosNivel]?

    enum CodingKeys: String, CodingKey {
        case arrayDiccionariosNivel1
        case arrayDiccionariosNivel2
        case arrayDiccionariosNivel3
        case arrayDiccionariosNivel4
    }
}

// MARK: - ArrayDiccionariosNivel
struct ArrayDiccionariosNivel: Codable {
    let tituloEjercicio: String?
    let descripcionEjercicio: String?
    let imagenEjercicio: String?
    let arrayEjerciciosResponse: [String]?

    enum CodingKeys: String, CodingKey {
        case tituloEjercicio
        case descripcionEjercicio
        case imagenEjercicio
        case arrayEjerciciosResponse
    }
}

struct TrainingModelHeader: Codable {
    let tituloEjercicio: String?
    let imagenEjercicio: String?
}

struct TrainingModelInfo: Codable {
    let descripcionEjercicio: String?
}

struct TrainingModelVideo: Codable {
    let arrayEjerciciosResponse: [String]?
}
