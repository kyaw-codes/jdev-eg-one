//
//  SpecialPerkCell.swift
//  JDevMMCohortOneEgOne
//
//  Created by Kyaw Zay Ya Lin Tun on 13/03/2023.
//

import UIKit

final class SpecialPerkCell: UICollectionViewCell {

    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var lblPercentage: UILabel!
    
    var vo: SpecialPerkCellVO? {
        didSet {
            bind(vo)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    private func setupView() {
        ivIcon.superview?.layer.cornerRadius = 40
        ivIcon.superview?.layer.masksToBounds = true
    }
    
    private func bind(_ vo: SpecialPerkCellVO?) {
        guard let vo = vo else { return }
        ivIcon.image = UIImage(systemName: vo.image)
        lblPercentage.text = "\(max(0, min(100, vo.percentage)))%"
    }
}
