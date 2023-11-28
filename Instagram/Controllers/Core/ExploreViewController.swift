//
//  ExploreViewController.swift
//  Instagram
//
//  Created by Mohammad Afshar on 15/09/2023.
//

import UIKit

class ExploreViewController: UIViewController {
    private let searchBar = UISearchController(searchResultsController: SearchResaultViewController())
    
    private var photosCollectionView: UICollectionView = {
        let oneOfThree = 130.0
        let twoOfThree = 260.0
        var counter = 0
        var bigLtoR = true
        
        let layout = UICollectionViewCompositionalLayout { index, _ in
            let leftItems = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(oneOfThree),
                                                                                 heightDimension: .absolute(oneOfThree)))
            leftItems.contentInsets = NSDirectionalEdgeInsets(top: 1.5, leading: 1.5, bottom: 1.5, trailing: 1.5)
            
            let rightItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                      heightDimension: .fractionalHeight(1)))
            rightItem.contentInsets = NSDirectionalEdgeInsets(top: 1.5, leading: 1.5, bottom: 1.5, trailing: 1.5)
            
            let leftGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(oneOfThree),
                                                                                            heightDimension: .absolute(twoOfThree)),
                                                         subitems: [leftItems, leftItems])
            
            let rightGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(twoOfThree),
                                                                                                   heightDimension: .absolute(twoOfThree)),
                                                                subitems: [rightItem])
            
            let bigRtoL = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                                 heightDimension: .absolute(twoOfThree)),
                                                              subitems: [leftGroup, rightGroup])
            
            let vanillaRow = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                                 heightDimension: .absolute(oneOfThree)),
                                                              subitems: [leftItems, leftItems, leftItems])
            
            let bigLtoR = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                                 heightDimension: .absolute(twoOfThree)),
                                                              subitems: [rightGroup, leftGroup])
            
            let finalGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                                 heightDimension: .absolute(twoOfThree*6)),
                                                              subitems: [bigRtoL, vanillaRow, vanillaRow, bigLtoR])
    //            finalGroup.interItemSpacing = .fixed(4)
            
//            let section = NSCollectionLayoutSection(group: finalGroup)
            let vanillaSection = NSCollectionLayoutSection(group: vanillaRow)
            let bigRtoLSection = NSCollectionLayoutSection(group: bigRtoL)
            let bigLtoRSection = NSCollectionLayoutSection(group: bigLtoR)
            var section: NSCollectionLayoutSection
    //            section.interGroupSpacing = 4.0
            switch counter {
                case 0...3:
                    section = bigRtoLSection
                    counter += 1
                case 3...6:
                    section = vanillaSection
                    counter += 1
                case 6...9:
                    section = vanillaSection
                    counter += 1
                case 9...12:
                    section = bigLtoRSection
                    counter = 0
                default:
                    section = vanillaSection
            }
            
            return section
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identity)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Explore"
        view.backgroundColor = .systemBackground
        
        searchBar.searchBar.placeholder = "Search..."
        searchBar.searchResultsUpdater = self
        (searchBar.searchResultsController as? SearchResaultViewController)?.delegate = self
        navigationItem.searchController = searchBar
        
        view.addSubview(photosCollectionView)
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        photosCollectionView.frame = view.bounds
    }
}

extension ExploreViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let resaultVC = searchController.searchResultsController as? SearchResaultViewController,
              let query = searchController.searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        DatabaseManager.shared.searchUsers(with: query) { users in
            DispatchQueue.main.async {
                resaultVC.update(with: users)
            }
        }
    }
}

extension ExploreViewController: SearchResaultViewControllerDelegate {
    func searchResaultViewController(_ vc: SearchResaultViewController, didSelectResaultWith: User) {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        DummyJson.dummyJson.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identity, for: indexPath) as? PhotoCollectionViewCell else {
            fatalError()
        }
        cell.loadFromUrl(from: DummyJson.dummyJson[indexPath.row])
//        cell.configure(with: UIImage(named: "story5"))
        return cell
    }
}
