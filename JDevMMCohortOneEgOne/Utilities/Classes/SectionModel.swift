//
//  SectionModel.swift
//  JDevMMCohortOneEgOne
//
//  Created by Kyaw Zay Ya Lin Tun on 18/03/2023.
//

import Foundation

protocol SectionItem {
    func to<T: SectionItem>(_ type: T.Type) -> T?
}

extension SectionItem {
    func to<T: SectionItem>(_ type: T.Type) -> T? {
        self as? T
    }
}

final class SectionModel<Header> {
    var header: Header?
    var items: [SectionItem]
    
    init(header: Header? = nil, items: [SectionItem]) {
        self.header = header
        self.items = items
    }
}
