//
//  TellMeMoreCell.swift
//  JDevMMCohortOneEgOne
//
//  Created by Kyaw Zay Ya Lin Tun on 12/03/2023.
//

import UIKit

final class TellMeMoreCell: UICollectionViewCell {
    
    @IBOutlet weak var lblBankShortCode: UILabel!
    @IBOutlet weak var lblBankName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnTellMeMore: UIButton!
    
    var onTellMeMoreTap: ((TellMeMoreCellVO?) -> Void)?
    
    var vo: TellMeMoreCellVO? {
        didSet {
            bind(vo)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
        setupInteraction()
    }
    
    private func setupView() {
        lblBankShortCode.superview?.layer.cornerRadius = 4
        self.layer.cornerRadius = 8
    }
    
    private func setupInteraction() {
        btnTellMeMore.addTarget(self, action: #selector(handleTellMeMoreTap), for: .touchUpInside)
    }
    
    private func bind(_ vo: TellMeMoreCellVO?) {
        guard let vo = vo else { return }
        lblBankShortCode.text = vo.shortCode
        lblBankName.text = vo.name
        lblDescription.text = vo.desc
    }
    
    @objc private func handleTellMeMoreTap() {
        onTellMeMoreTap?(vo)
    }
}
