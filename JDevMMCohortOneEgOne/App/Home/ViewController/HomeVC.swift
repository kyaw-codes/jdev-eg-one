//
//  HomeVC.swift
//  JDevMMCohortOneEgOne
//
//  Created by Kyaw Zay Ya Lin Tun on 12/03/2023.
//

import UIKit

final class HomeVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let tellMeMoreVO = TellMeMoreCellVO.mock
    private let featureVOs = FeatureCellVO.allCases
    private let accountVOs = BankAccountCellVO.mocks
    private let specialPerksVOs = SpecialPerkCellVO.mocks
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        setupNavTitle()
        setupCollectionView()
    }
    
    private func setupNavTitle() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.title = "Welcome Back!"
    }
    
    private func setupCollectionView() {
        collectionView.setCollectionViewLayout(makeCompositionalLayout(), animated: true)
        collectionView.contentInset.bottom = additionalSafeAreaInsets.bottom

        collectionView.register(nibs: [SpecialPerkCell.className, BankAccountCell.className, TellMeMoreCell.className, FeatureCell.className])
        collectionView.registerSectionHeader(nib: TextHeaderCell.className)

        collectionView.dataSource = self
    }
}

// MARK: - DataSource
extension HomeVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return featureVOs.count
        } else if section == 2 {
            return accountVOs.count
        } else {
            return specialPerksVOs.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.deque(TellMeMoreCell.self, index: indexPath)
            cell.vo = tellMeMoreVO
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.deque(FeatureCell.self, index: indexPath)
            cell.vo = featureVOs[indexPath.row]
            return cell
        } else if indexPath.section == 2 {
            let cell = collectionView.deque(BankAccountCell.self, index: indexPath)
            cell.vo = accountVOs[indexPath.row]
            return cell
        } else {
            let cell = collectionView.deque(SpecialPerkCell.self, index: indexPath)
            cell.vo = specialPerksVOs[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 1 {
            let header = collectionView.dequeHeader(TextHeaderCell.self, index: indexPath)
            header.lblTitle.text = "Feature"
            return header
        } else if indexPath.section == 3 {
            let header = collectionView.dequeHeader(TextHeaderCell.self, index: indexPath)
            header.lblTitle.text = "Special Perks"
            return header
        }
        return .init()
    }
}

// MARK: Compositional layout
extension HomeVC {
    
    private func makeCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] section, _ in
            if section == 0 {
                return self?.makeTellMeMoreSection()
            } else if section == 1 {
                return self?.makeFeatureSection()
            } else if section == 2 {
                return self?.makeBankAccountSection()
            } else {
                return self?.makeSpecialPerksSection()
            }
        }
    }
    
    private func makeTellMeMoreSection() -> NSCollectionLayoutSection? {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(140)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(140)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 16, leading: 20, bottom: 10, trailing: 20)
        return section
    }
    
    private func makeFeatureSection() -> NSCollectionLayoutSection? {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalWidth(0.25)), subitems: [item])
        group.contentInsets.trailing = 20

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 20
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        ]

        return section
    }
    
    private func makeBankAccountSection() -> NSCollectionLayoutSection? {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.7), heightDimension: .fractionalWidth(0.5)), subitems: [item])
        group.contentInsets = .init(top: 30, leading: 0, bottom: 0, trailing: 20)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 20, bottom: 20, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func makeSpecialPerksSection() -> NSCollectionLayoutSection? {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(100), heightDimension: .absolute(140)), subitems: [item])
        group.contentInsets.trailing = 12

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 8)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        ]

        return section
    }
}
