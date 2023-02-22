//
//  FoodCollectionView.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 22.02.23.
//

import UIKit

class FoodCollectionView: UIView {
    
    //MARK: - UI Elements
    private lazy var foodCollectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout {sectionIndex, _ -> NSCollectionLayoutSection? in
            return Self.createSectionLayout(sectionIndex)
        }
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        backgroundColor = Asset.Colors.background.color
        
        view.register(FoodCategoryCell.self, forCellWithReuseIdentifier: CollectionViewCellIDs.foodCategory.identifier)
        view.register(PopularDishesCell.self, forCellWithReuseIdentifier: CollectionViewCellIDs.popularDishes.identifier)
        view.register(ChefsSpecialCell.self, forCellWithReuseIdentifier: CollectionViewCellIDs.chefsSpecial.identifier)
        view.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewCellIDs.header.identifier)
        
        view.dataSource = self
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.Colors.background.color
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Functions
    private func setupUI() {
        addSubview(foodCollectionView)
        
        NSLayoutConstraint.activate([
            foodCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            foodCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            foodCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            foodCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    private static func createSectionLayout(_ section: Int) -> NSCollectionLayoutSection {
        let supplementaryViews = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(50)),
                elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            
        ]
        switch section {
        case 0:
            //Item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 5)
            
            //Horizontal group
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.92),
                    heightDimension: .absolute(390)),
                repeatingSubitem: item,
                count: 1)
            
            //Section
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            section.orthogonalScrollingBehavior = .groupPagingCentered
            section.boundarySupplementaryItems = supplementaryViews
            return section
        case 1:
            //Item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(200),
                    heightDimension: .absolute(240)
                )
            )
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 4, bottom: 10, trailing: 4)
            
            //Group
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(200),
                    heightDimension: .absolute(240)),
                repeatingSubitem: item,
                count: 1)
            
            //Section
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.boundarySupplementaryItems = supplementaryViews
            return section
        case 2:
            
            //Item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(200),
                    heightDimension: .absolute(240)
                )
            )
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 4, bottom: 10, trailing: 4)
            
            //Group
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(200),
                    heightDimension: .absolute(240)),
                repeatingSubitem: item,
                count: 1)
            
            //Section
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.boundarySupplementaryItems = supplementaryViews
            return section
        default:
            //Item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            item.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            //Vertical group in horizontal group
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(390)),
                repeatingSubitem: item,
                count: 1
            )
            
            //Section
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = supplementaryViews
            return section
        }
    }
}

//MARK: - Extension
extension FoodCollectionView: UICollectionViewDataSource,
                              UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 4
        case 2:
            return 5
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIDs.foodCategory.identifier, for: indexPath) as! FoodCategoryCell
            cell.setupCell(with: "Hello")
            cell.layer.cornerRadius = 16
            cell.clipsToBounds = true
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIDs.popularDishes.identifier, for: indexPath) as! PopularDishesCell
            cell.setupCell(with: "Hey")
            cell.layer.cornerRadius = 16
            cell.clipsToBounds = true
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIDs.chefsSpecial.identifier, for: indexPath) as! ChefsSpecialCell
            cell.setupCell(with: "Hi")
            cell.layer.cornerRadius = 16
            cell.clipsToBounds = true
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewCellIDs.header.identifier, for: indexPath) as! HeaderView
            if indexPath.section == 0 {
                header.setupHeader(with: CollectionVewHeaderType.foodCategory.title)
            } else if indexPath.section == 1 {
                header.setupHeader(with: CollectionVewHeaderType.popularDishes.title)
            } else {
                header.setupHeader(with: CollectionVewHeaderType.chefsSpecial.title)
            }
            return header
        }
        return UICollectionReusableView()
    }
}
