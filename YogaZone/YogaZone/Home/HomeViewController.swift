//
//  ViewController.swift
//  CompositionalLayout
//
//  Created by Philippe Muniz Gomes on 17/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    private let categoryHeaderId = "categoryHeaderId"
    private let headerId = "headerId"
    
    
    lazy var headerView = HomeHeader()
    
    lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupConstraints()
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        ])
        
    }
}

// MARK: Setup CollectionView
extension HomeViewController {
    func setupCollectionView() {
        collectionView.frame = .init(x: 0, y: headerView.frame.height, width: view.frame.width, height: view.frame.height - headerView.frame.height)
        self.collectionView.backgroundColor = .white
        self.collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.identifier)
        self.collectionView.register(CategoryHeaderView.self, forSupplementaryViewOfKind: categoryHeaderId, withReuseIdentifier: CategoryHeaderView.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.view.addSubview(self.headerView)
        self.view.addSubview(self.collectionView)
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
extension HomeViewController {
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
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(120))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 8, bottom: 20, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)

        return section
    }
    
    private func thirdLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(120))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.bottom = 15
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.35))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 8)
       
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
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as? CardCell
        
        if (indexPath.section == 0) {
            switch indexPath.row {
                case 0: cell?.setupCell(imageName: "poses")
                case 1: cell?.setupCell(imageName: "imc")
                default: cell?.setupCell(imageName: "respiracao")
            }
        } else if(indexPath.section == 1) {
            switch indexPath.row {
                case 0: cell?.setupCell(imageName: "meditacao")
                default: cell?.setupCell(imageName: "treinos")
            }
        } else {
            cell?.setupCell(imageName: "eventos")
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CategoryHeaderView.identifier, for: indexPath) as? CategoryHeaderView
         
        sectionHeader?.label.text = indexPath.section == 0 ? "Daily Progress" : "Events"
        
        return sectionHeader ?? UICollectionReusableView()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 3
            case 1:
                return 2
            default:
                return 1
        }
    }
}
