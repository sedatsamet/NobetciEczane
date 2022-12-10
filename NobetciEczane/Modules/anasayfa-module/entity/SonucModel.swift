//
//  SonucModel.swift
//  NobetciEczane
//
//  Created by Sedat Samet Oypan on 10.12.2022.
//

import Foundation

struct SonucModel: Codable {
    let success: Bool
    let result: [Result]
}

// MARK: - Result
struct Result: Codable {
    let name, dist, address, phone: String
    let loc: String
}
