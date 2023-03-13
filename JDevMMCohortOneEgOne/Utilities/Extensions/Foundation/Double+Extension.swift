//
//  Double+Extension.swift
//  JDevMMCohortOneEgOne
//
//  Created by Kyaw Zay Ya Lin Tun on 13/03/2023.
//

import Foundation

public extension Double {
    func toCurrency(withPrefix symbol: String = "") -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        formatter.currencySymbol = symbol
        formatter.minimumFractionDigits = self.truncatingRemainder(dividingBy: 1) == 0 ? 0 : 2
        var str = formatter.string(from: NSNumber(value: self)) ?? ""
        
        if str.contains(".") {
            while str.last == "0" {
                str.removeLast()
            }
        }
        return str
    }
}
