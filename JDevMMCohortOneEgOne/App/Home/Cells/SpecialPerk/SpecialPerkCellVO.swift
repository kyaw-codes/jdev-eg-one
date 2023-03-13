//
//  SpecialPerkCellVO.swift
//  JDevMMCohortOneEgOne
//
//  Created by Kyaw Zay Ya Lin Tun on 13/03/2023.
//

import Foundation

struct SpecialPerkCellVO {
    let image: String
    let percentage: Double
}

extension SpecialPerkCellVO {
    static let mocks: [SpecialPerkCellVO] = [
        .init(image: "shippingbox.fill", percentage: 4),
        .init(image: "xbox.logo", percentage: 1),
        .init(image: "sparkles", percentage: 8),
        .init(image: "flag.checkered", percentage: 2),
        .init(image: "mustache.fill", percentage: 3)
    ]
}
