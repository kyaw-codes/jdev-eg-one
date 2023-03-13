//
//  UIViewController+Extensions.swift
//  JDevMMCohortOneEgOne
//
//  Created by Kyaw Zay Ya Lin Tun on 12/03/2023.
//

import UIKit

public extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
