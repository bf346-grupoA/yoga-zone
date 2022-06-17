//
//  CardMenuCell.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 17/03/22.
//

import UIKit

// MARK: Lifecycle & Props
class CardMenuCell: UITableViewCell {
    weak var delegate: NavigationDelegate?
    
    private let categoryHeaderId = "categoryHeaderId"
    private let headerId = "headerId"
    lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}

// MARK: Setup UI Constraints & CollectionView
extension CardMenuCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            self.collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)

        ])
    }
    
    func setupCollectionView() {
        
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        
        self.collectionView.frame = .init(x: 0, y: 0, width: self.contentView.frame.width, height: self.contentView.frame.height)
        self.collectionView.backgroundColor = .clear
        self.collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.identifier)
        self.collectionView.register(CategoryHeaderView.self, forSupplementaryViewOfKind: categoryHeaderId, withReuseIdentifier: CategoryHeaderView.identifier)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.contentView.addSubview(self.collectionView)
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            switch sectionNumber {
                case 0: return self.firstLayoutSection()
                case 1: return self.secondLayoutSection()
                default: return self.thirdLayoutSection()
            }
        }
    }
}


// MARK: Section Builders
extension CardMenuCell {
    
    private func firstLayoutSection() -> NSCollectionLayoutSection {
        
        // Single Item
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(2/4),
                heightDimension: .fractionalHeight(0.99)
            )
        )
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 8)
        
        // Stacked Item
        let verticalStackItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalHeight(0.84),
                heightDimension: .fractionalHeight(0.9)
            )
        )
        
        verticalStackItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 8)
        

        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1/2),
                heightDimension: .fractionalHeight(1)
            ),
            subitem: verticalStackItem,
            count: 2
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(3/5)),
            subitems: [ item, verticalGroup ]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 8
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(44)
                ),
                elementKind: categoryHeaderId,
                alignment: .top
            )
        ]
        
        return section
    }
    
    private func secondLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(130))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.bottom = 15
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.35))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 0, bottom: 100, trailing: 8)
       
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 8

        return section
    }
    
    private func thirdLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.bottom = 15
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.35))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 0, bottom: 100, trailing: 8)
       
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 8
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(44)
                ),
                elementKind: categoryHeaderId,
                alignment: .top
            )
        ]
        
        return section
    }
    
}


// MARK: DataSource and Delegate
extension CardMenuCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 3
            case 1:
                return 1
            default:
                return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as? CardCell
        
        let image = AssetHelper.getImageName(indexPath: indexPath)
        let destinationIndex = NavigationHelper.getDestinationIndex(indexPath: indexPath)

        cell?.setupCell(imageName: image, destinationIndex: destinationIndex)
                
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CategoryHeaderView.identifier, for: indexPath) as? CategoryHeaderView
         
        sectionHeader?.label.text = indexPath.section == 0 ? "Atividades" : "Social"
        
        return sectionHeader ?? UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationIndex = NavigationHelper.getDestinationIndex(indexPath: indexPath)
        self.delegate?.navigateTo(routeIndex: destinationIndex)
    }
    
}

// MARK: Static properties & methods
extension CardMenuCell {
    static let identifier: String = "CardMenuCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
