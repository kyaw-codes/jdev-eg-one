//
//  FeatureCellVO.swift
//  JDevMMCohortOneEgOne
//
//  Created by Kyaw Zay Ya Lin Tun on 12/03/2023.
//

import UIKit

enum FeatureCellVO: CaseIterable {
    case send
    case transfer
    case cashback
    case applyLoan
    case giftCard
}

extension FeatureCellVO {
    var title: String {
        switch self {
        case .send:
            return "Send"
        case .transfer:
            return "Transfer"
        case .cashback:
            return "Cashback"
        case .applyLoan:
            return "Apply Loan"
        case .giftCard:
            return "Gift Card"
        }
    }
    
    var bgColor: UIColor {
        switch self {
        case .send:
            return .systemBlue
        case .transfer:
            return .systemPurple
        case .cashback:
            return .systemOrange
        case .applyLoan:
            return .systemTeal
        case .giftCard:
            return .systemGreen
        }
    }
    
    var tintColor: UIColor {
        return .white
    }
    
    var icon: String {
        switch self {
        case .send:
            return "paperplane.fill"
        case .transfer:
            return "rectangle.portrait.and.arrow.forward.fill"
        case .cashback:
            return "creditcard.fill"
        case .applyLoan:
            return "doc.text"
        case .giftCard:
            return "giftcard.fill"
        }
    }
}
