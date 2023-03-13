//
//  BankAccountCellVO.swift
//  JDevMMCohortOneEgOne
//
//  Created by Kyaw Zay Ya Lin Tun on 13/03/2023.
//

import Foundation

struct BankAccountCellVO {
    let title: String
    let cardNo: String
    let availableBalance: Double
}

extension BankAccountCellVO {
    static let mocks: [BankAccountCellVO] = [
        .init(title: "Monkey Bank Account", cardNo: "4232342323", availableBalance: 158),
        .init(title: "Monkey Savings Account", cardNo: "54252361", availableBalance: 200)
    ]
}
