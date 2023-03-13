//
//  FeatureCell.swift
//  JDevMMCohortOneEgOne
//
//  Created by Kyaw Zay Ya Lin Tun on 12/03/2023.
//

import UIKit

final class FeatureCell: UICollectionViewCell {
    
    @IBOutlet weak var badgeView: UIView!
    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var lblText: UILabel!
    
    var onTap: ((FeatureCellVO?) -> Void)?
    
    var vo: FeatureCellVO? {
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
        badgeView.layer.cornerRadius = 8
    }
    
    private func setupInteraction() {
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCellTap)))
    }
    
    private func bind(_ vo: FeatureCellVO?) {
        guard let vo = vo else { return }
        badgeView.backgroundColor = vo.bgColor
        ivIcon.image = UIImage(systemName: vo.icon)?.withTintColor(vo.tintColor)
        lblText.text = vo.title
    }
    
    @objc private func handleCellTap() {
        onTap?(vo)
    }
}
