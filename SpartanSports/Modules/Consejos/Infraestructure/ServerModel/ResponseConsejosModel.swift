//
//  ResponseConsejosModel.swift
//  SpartanSports
//
//  Created by MAC on 1/6/21.
//


// MARK: - IcoResponseConsejos
struct ResponseConsejosModel: Codable {
    let consejosGenerales: [ConsejosGenerale]?

    enum CodingKeys: String, CodingKey {
        case consejosGenerales = "consejosGenerales"
    }
}

// MARK: - ConsejosGenerale
struct ConsejosGenerale: Codable {
    let image: String?
    let title: String?
    let subtitle: String?
    let messageArray: [MessageArray]?

    enum CodingKeys: String, CodingKey {
        case image = "image"
        case title = "title"
        case subtitle = "subtitle"
        case messageArray = "messageArray"
    }
}

// MARK: - MessageArray
struct MessageArray: Codable {
    let titleMessage: String?
    let developMessage: String?

    enum CodingKeys: String, CodingKey {
        case titleMessage = "titleMessage"
        case developMessage = "developMessage"
    }
}

