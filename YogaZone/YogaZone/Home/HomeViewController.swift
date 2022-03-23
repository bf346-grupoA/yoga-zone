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
            self.headerView.topAnchor.constraint(equalTo: view.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            self.headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            
            self.collectionView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: 20),
            self.collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ])
    }
}

// MARK: Setup CollectionView
extension HomeViewController {
    func setupCollectionView() {
        self.collectionView.frame = .init(x: 0, y: self.headerView.frame.height, width: view.frame.width, height: view.frame.height + self.headerView.frame.height)
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
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(140))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 6, bottom: 10, trailing: 6)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)

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
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as? CardCell
        
        let image = Router.getImageName(indexPath: indexPath)
        let destinationIndex = Router.getDestinationIndex(indexPath: indexPath)
        cell?.delegate = self
        
        cell?.setupCell(imageName: image, destinationIndex: destinationIndex)
                
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

extension HomeViewController: Selectable {
    func navigateTo(routeIndex: Int) {
        switch routeIndex {
            case 1: self.navigationController?.pushViewController(PoseGalleryViewController(), animated: true)
            case 2: self.navigationController?.pushViewController(ImcController(), animated: true)
            case 3: self.navigationController?.pushViewController(BreathingHomeViewController(), animated: true)
            case 4: self.navigationController?.pushViewController(MeditacaoHomeViewController(), animated: true)
            case 5: self.navigationController?.pushViewController(TreinoUmController(), animated: true)
            default:
            let storyboard = UIStoryboard(name: "HomeEvents", bundle: nil)
            self.navigationController?.pushViewController(storyboard.instantiateViewController(identifier: "HomeEventsViewController"), animated: true)           
        }
    }
}
