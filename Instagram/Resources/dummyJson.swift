//
//  dummyJson.swift
//  Instagram
//
//  Created by Mohammad Afshar on 28/11/2023.
//

import Foundation

class DummyJson {
    static let dummyJson: [String] = [
        
        "https://images.pexels.com/photos/12448667/pexels-photo-12448667.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/19139347/pexels-photo-19139347/free-photo-of-christmas-decorations-in-a-store-window.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/18868012/pexels-photo-18868012/free-photo-of-young-woman-in-beige-blouse-lying-with-a-book-on-a-picnic-blanket.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/19150817/pexels-photo-19150817/free-photo-of-young-men-in-chinese-condominium.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/19045609/pexels-photo-19045609/free-photo-of-young-couple-sitting-back-to-back.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/15778453/pexels-photo-15778453/free-photo-of-woman-standing-on-a-wooden-board-on-the-shore-of-a-frozen-lake.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/10767028/pexels-photo-10767028.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/18494142/pexels-photo-18494142/free-photo-of-smiling-blond-with-umbrella-on-street-in-city-downtown.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/18978813/pexels-photo-18978813/free-photo-of-young-redhead-in-sunglasses-sitting-at-the-table-outside-of-a-house.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/18792337/pexels-photo-18792337/free-photo-of-gingerbread-house-on-a-stack-of-wrapped-christmas-gifts.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/18444146/pexels-photo-18444146/free-photo-of-a-man-is-looking-out-of-a-window.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/18701746/pexels-photo-18701746/free-photo-of-woman-sitting-in-a-bamboo-forest.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/15161093/pexels-photo-15161093/free-photo-of-colorful-marshmallows-in-a-cup-of-hot-chocolate.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/19154211/pexels-photo-19154211/free-photo-of-guitarist-during-event.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/19228328/pexels-photo-19228328/free-photo-of-a-cowboy-riding-a-horse-at-sunset.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/19010668/pexels-photo-19010668/free-photo-of-book-rowan-and-tea-on-picnic-blanket.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/17867905/pexels-photo-17867905/free-photo-of-woman-eating-sour-apples.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/18346899/pexels-photo-18346899/free-photo-of-two-canaries-in-the-room.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/18387502/pexels-photo-18387502/free-photo-of-young-woman-holding-a-bunch-of-sunflowers.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/18550229/pexels-photo-18550229/free-photo-of-model-in-checked-blazer-and-boots.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/18868190/pexels-photo-18868190/free-photo-of-red-headed-woman-in-white-tulle-dress-sitting-reading-a-book-in-orchard.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/18697363/pexels-photo-18697363/free-photo-of-women-sitting-on-bench-in-park-in-town.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/18885164/pexels-photo-18885164/free-photo-of-wedding-couple-in-a-park.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        
        "https://images.pexels.com/photos/18866335/pexels-photo-18866335/free-photo-of-blonde-in-white-tank-top.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load"
    ]
}

//lazy private var photosCollectionView: UICollectionView = {
//    let oneOfThree = self.view.width/3
//    let twoOfThree = (self.view.width/3)*2
//    let layout = UICollectionViewCompositionalLayout { index, _ in
//        let leftItems = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(oneOfThree),
//                                                                             heightDimension: .absolute(oneOfThree)))
//        leftItems.contentInsets = NSDirectionalEdgeInsets(top: 1.5, leading: 1.5, bottom: 1.5, trailing: 1.5)
//        
//        let rightItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                                                  heightDimension: .fractionalHeight(1)))
//        rightItem.contentInsets = NSDirectionalEdgeInsets(top: 1.5, leading: 1.5, bottom: 1.5, trailing: 1.5)
//        
//        let leftGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(oneOfThree),
//                                                                                        heightDimension: .absolute(twoOfThree)),
//                                                     subitems: [leftItems, leftItems])
//        
//        let rightGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(twoOfThree),
//                                                                                               heightDimension: .absolute(twoOfThree)),
//                                                            subitems: [rightItem])
//        
//        let bigRtoL = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                                                             heightDimension: .absolute(twoOfThree)),
//                                                          subitems: [leftGroup, rightGroup])
//        
//        let vanillaRow = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                                                             heightDimension: .absolute(oneOfThree)),
//                                                          subitems: [leftItems, leftItems, leftItems])
//        
//        let bigLtoR = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                                                             heightDimension: .absolute(twoOfThree)),
//                                                          subitems: [rightGroup, leftGroup])
//        
//        let finalGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                                                             heightDimension: .absolute(twoOfThree*6)),
//                                                          subitems: [bigRtoL, vanillaRow, vanillaRow, bigLtoR])
////            finalGroup.interItemSpacing = .fixed(4)
//        
//        let section = NSCollectionLayoutSection(group: finalGroup)
////            section.interGroupSpacing = 4.0
//        return section
//    }
//    
//    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//    collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identity)
//    collectionView.backgroundColor = .systemBackground
//    return collectionView
//}()




//lazy private var photosCollectionView: UICollectionView = {
//    let layout = UICollectionViewCompositionalLayout { index, _ in
//        let oneOfThree = self.view.width/3
//        let twoOfThree = (self.view.width/3)*2
//        
//        // Create layout groups for each arrangement
//        let leftItems = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(oneOfThree), heightDimension: .absolute(oneOfThree)))
//        leftItems.contentInsets = NSDirectionalEdgeInsets(top: 1.5, leading: 1.5, bottom: 1.5, trailing: 1.5)
//        
//        let rightItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
//        rightItem.contentInsets = NSDirectionalEdgeInsets(top: 1.5, leading: 1.5, bottom: 1.5, trailing: 1.5)
//        
//        let bigRtoLGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(twoOfThree)), subitems: [rightItem, leftItems])
//        
//        let vanillaRowGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(oneOfThree)), subitems: [leftItems, leftItems, leftItems])
//        
//        let bigLtoRGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(twoOfThree)), subitems: [leftItems, rightItem])
//        
//        // Create separate sections for each arrangement
//        let bigRtoLSection = NSCollectionLayoutSection(group: bigRtoLGroup)
//        let vanillaRowSection = NSCollectionLayoutSection(group: vanillaRowGroup)
//        let bigLtoRSection = NSCollectionLayoutSection(group: bigLtoRGroup)
//        
//        // Return the appropriate section based on the index
//        switch index {
//            case 0:
//                return bigRtoLSection
//            case 1, 2:
//                return vanillaRowSection
//            default:
//                return bigLtoRSection
//        }
//    }
//    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//    collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identity)
//    collectionView.backgroundColor = .systemBackground
//    return collectionView
//}()
