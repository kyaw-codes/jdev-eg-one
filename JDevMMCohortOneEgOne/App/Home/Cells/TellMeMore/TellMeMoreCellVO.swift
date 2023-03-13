//
//  TellMeMoreCellVO.swift
//  JDevMMCohortOneEgOne
//
//  Created by Kyaw Zay Ya Lin Tun on 12/03/2023.
//

import Foundation

struct TellMeMoreCellVO {
    let shortCode: String
    let name: String
    let desc: String
}

extension TellMeMoreCellVO {
    static let mock: TellMeMoreCellVO = .init(shortCode: "MKY", name: "Monkey Advance", desc: "Get up to $100 instantly. No \"tips\" or monthly subscriptions.")
}
