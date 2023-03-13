//
//  CardNoView.swift
//  JDevMMCohortOneEgOne
//
//  Created by Kyaw Zay Ya Lin Tun on 13/03/2023.
//

import UIKit

final class CardNoView: UIView {

    @IBOutlet weak var lblLastFourDigit: UILabel!
    
    var number: String? {
        didSet {
            rerenderLabel(number)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    private func setupView() {
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    private func rerenderLabel(_ string: String?) {
        guard let string = string else { return }
        if string.count >= 4 {
            lblLastFourDigit.text = String(string.suffix(4))
        } else {
            lblLastFourDigit.text = string
        }
    }
}
