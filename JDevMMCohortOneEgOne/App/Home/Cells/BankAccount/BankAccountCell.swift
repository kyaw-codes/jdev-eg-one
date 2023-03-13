//
//  BankAccountCell.swift
//  JDevMMCohortOneEgOne
//
//  Created by Kyaw Zay Ya Lin Tun on 13/03/2023.
//

import UIKit

final class BankAccountCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var cardNoView: CardNoView!
    @IBOutlet weak var lblAvailableBalance: UILabel!
    
    var vo: BankAccountCellVO? {
        didSet {
            bind(vo)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }

    private func setupView() {
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
    
    private func bind(_ vo: BankAccountCellVO?) {
        guard let vo = vo else { return }
        lblTitle.text = vo.title
        cardNoView.number = vo.cardNo
        lblAvailableBalance.text = vo.availableBalance.toCurrency(withPrefix: "$")
    }
}
