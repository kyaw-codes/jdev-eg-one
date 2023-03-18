//
//  HomeVC.swift
//  JDevMMCohortOneEgOne
//
//  Created by Kyaw Zay Ya Lin Tun on 12/03/2023.
//

import UIKit

enum HomeSection {
    case tellMeMore
    case feature(String)
    case account
    case specialPerks(String)
}

final class HomeVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate let models: [SectionModel<HomeSection>] = [
        .init(header: .feature("Features"), items: FeatureCellVO.allCases),
        .init(header: .tellMeMore, items: [TellMeMoreCellVO.mock]),
        .init(header: .specialPerks("Perks"), items: SpecialPerkCellVO.mocks),
        .init(header: .account, items: BankAccountCellVO.mocks)
    ]
    
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
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = models[indexPath.section].items[indexPath.item]
        switch item {
        case is TellMeMoreCellVO:
            let cell = collectionView.deque(TellMeMoreCell.self, index: indexPath)
            cell.vo = item.to(TellMeMoreCellVO.self)
            return cell
        case is FeatureCellVO:
            let cell = collectionView.deque(FeatureCell.self, index: indexPath)
            cell.vo = item.to(FeatureCellVO.self)
            return cell
        case is BankAccountCellVO:
            let cell = collectionView.deque(BankAccountCell.self, index: indexPath)
            cell.vo = item.to(BankAccountCellVO.self)
            return cell
        case is SpecialPerkCellVO:
            let cell = collectionView.deque(SpecialPerkCell.self, index: indexPath)
            cell.vo = item.to(SpecialPerkCellVO.self)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = models[indexPath.section].header
        switch header {
        case .feature(let title), .specialPerks(let title):
            let header = collectionView.dequeHeader(TextHeaderCell.self, index: indexPath)
            header.lblTitle.text = title
            return header
        default:
            return .init()
        }
    }
}

// MARK: Compositional layout
extension HomeVC {
    
    private func makeCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] section, _ in
            let section = self?.models[section].header
            
            switch section {
            case .tellMeMore:
                return self?.makeTellMeMoreSection()
            case .feature:
                return self?.makeFeatureSection()
            case .account:
                return self?.makeBankAccountSection()
            case .specialPerks:
                return self?.makeSpecialPerksSection()
            case .none:
                return nil
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
