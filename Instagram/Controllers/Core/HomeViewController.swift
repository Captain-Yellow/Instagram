//
//  ViewController.swift
//  Instagram
//
//  Created by Mohammad Afshar on 12/09/2023.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    private var compositionCollectionView: UICollectionView?
    private var viewModels = [[HomeFeedCellType]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        fetchPosts()
        compositionCollectionViewConfig()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        compositionCollectionView?.frame = view.bounds
    }
    
    // Collection View Delegates
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = viewModels[indexPath.section][indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = .red
        switch cellType {
            case .poster(viewModel: let viewModel):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.identifier, for: indexPath) as? PosterCollectionViewCell else {
                    fatalError()
                }
                cell.configure(with: viewModel)
                cell.delegate = self
                return cell
            case .post(viewModel: let viewModel):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else {
                    fatalError()
                }
                cell.configure(with: viewModel)
                cell.delegate = self
                return cell
            case .actions(viewModel: let viewModel):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostActionCollectionViewCell.identifier, for: indexPath) as? PostActionCollectionViewCell else {
                    fatalError()
                }
                cell.configure(with: viewModel)
                cell.delegate = self
                return cell
            case .likeCount(viewModel: let viewModel):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostLikesCollectionViewCell.identifier, for: indexPath) as? PostLikesCollectionViewCell else {
                    fatalError()
                }
                cell.configure(with: viewModel)
                cell.delegate = self
                return cell
            case .caption(viewModel: let viewModel):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCaptionCollectionViewCell.identifier, for: indexPath) as? PostCaptionCollectionViewCell else {
                    fatalError()
                }
                cell.configure(with: viewModel)
                cell.delegate = self
                return cell
            case .timestamp(viewModel: let viewModel):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostDatetimeCollectionViewCell.identifier, for: indexPath) as? PostDatetimeCollectionViewCell else {
                    fatalError()
                }
                cell.configure(with: viewModel)
                return cell
        }
    }
    
    private func fetchPosts() {
        let postData1: [HomeFeedCellType] = [
            .poster(viewModel: PosterCollectionViewCellViewModel(username: "Lovly Anne", profilePictureUrl: URL(string: "https://img.freepik.com/free-photo/excited-happy-young-pretty-woman_171337-2006.jpg?w=2000&t=st=1696774995~exp=1696775595~hmac=88e42e8101a9bf4d8632df1c74be4e0472c426f69a7c9d49a83d22d1be014c5e")!)),
            .post(viewModel: PostCollectionViewCellViewModel(postUrl: URL(string: "https://img.freepik.com/free-photo/excited-good-looking-girl-making-selfie-outdoor-shot-chilling-female-model-posing-city_197531-11394.jpg?w=2000&t=st=1696775056~exp=1696775656~hmac=baf98d4bf609f4da037a5f7facebc6baa83d6b71ae7378eae47a4aeb51cd4893")!)),
            .actions(viewModel: PostActionsCollectionViewCellViewModel(isLiked: true)),
            .likeCount(viewModel: PostLikesCollectionViewCellViewModel(likers: ["Alex", "Anotni", "mamad"])),
            .caption(viewModel: PostCaptionCollectionViewCellViewModel(username: "Alex", caption: "Beautiful as Always")),
            .timestamp(viewModel: PostDatetimeCollectionViewCellViewModel(date: Date()))
            
        ]
        let postData2: [HomeFeedCellType] = [
            .poster(viewModel: PosterCollectionViewCellViewModel(username: "Lovly Anne", profilePictureUrl: URL(string: "https://img.freepik.com/free-photo/excited-happy-young-pretty-woman_171337-2006.jpg?w=2000&t=st=1696774995~exp=1696775595~hmac=88e42e8101a9bf4d8632df1c74be4e0472c426f69a7c9d49a83d22d1be014c5e")!)),
            .post(viewModel: PostCollectionViewCellViewModel(postUrl: URL(string: "https://img.freepik.com/free-photo/positive-young-women-laughing-balcony_197531-23679.jpg?w=2000&t=st=1696856274~exp=1696856874~hmac=f478492a009c5a13da31ca27448befbe0cf156f4768314168cbac89cd186565c")!)),
            .actions(viewModel: PostActionsCollectionViewCellViewModel(isLiked: true)),
            .likeCount(viewModel: PostLikesCollectionViewCellViewModel(likers: ["oneMan"])),
            .caption(viewModel: PostCaptionCollectionViewCellViewModel(username: "Alex", caption: "Beautiful as Always")),
            .timestamp(viewModel: PostDatetimeCollectionViewCellViewModel(date: Date()))
            
        ]
        let postData3: [HomeFeedCellType] = [
            .poster(viewModel: PosterCollectionViewCellViewModel(username: "Lovly Anne", profilePictureUrl: URL(string: "https://img.freepik.com/free-photo/excited-happy-young-pretty-woman_171337-2006.jpg?w=2000&t=st=1696774995~exp=1696775595~hmac=88e42e8101a9bf4d8632df1c74be4e0472c426f69a7c9d49a83d22d1be014c5e")!)),
            .post(viewModel: PostCollectionViewCellViewModel(postUrl: URL(string: "https://img.freepik.com/free-photo/cheerful-girl-cashmere-sweater-laughs-against-backdrop-blossoming-sakura-portrait-woman-yellow-hoodie-city-spring_197531-17886.jpg?w=900&t=st=1696854222~exp=1696854822~hmac=ceabc0520282430b29f3de751dbaffb351a41f0297b10418238cff4867f32070")!)),
            .actions(viewModel: PostActionsCollectionViewCellViewModel(isLiked: true)),
            .likeCount(viewModel: PostLikesCollectionViewCellViewModel(likers: ["oneMan"])),
            .caption(viewModel: PostCaptionCollectionViewCellViewModel(username: "on", caption: "ok")),
            .timestamp(viewModel: PostDatetimeCollectionViewCellViewModel(date: Date()))
            
        ]
        viewModels.append(postData1)
        viewModels.append(postData2)
        viewModels.append(postData3)
        compositionCollectionView?.reloadData()
    }
}

// Collection View Deceleration
extension HomeViewController {
    private func compositionCollectionViewConfig() {
        /// Dont forget: Call Configuration in viewDidLoad - set frame in viewDidLayoutSubviews - Match groupSize with section items height - Conform to Protocol
        /// OPtional: Register All Cells if Exist
        var groupSize: CGFloat {
            view.width + 240
        }
        compositionCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { index, _ -> NSCollectionLayoutSection? in
            
            // Item
            let posterItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)))
            
            let postItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1)))
            
            let actionItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)))
            
            let likeCountItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)))
            
            let captionsItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)))
            
            let timestampItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)))
            
            // Group
            let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(groupSize)), subitems: [posterItem, postItem, actionItem, likeCountItem, captionsItem, timestampItem])
            
            // Section
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 10, trailing: 0)
                        
            return section
        }))
        
        view.addSubview(compositionCollectionView!)
        compositionCollectionView?.delegate = self
        compositionCollectionView?.dataSource = self
        compositionCollectionView?.backgroundColor = .systemBackground
        compositionCollectionView?.register(PosterCollectionViewCell.self, forCellWithReuseIdentifier: PosterCollectionViewCell.identifier)
        compositionCollectionView?.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        compositionCollectionView?.register(PostActionCollectionViewCell.self, forCellWithReuseIdentifier: PostActionCollectionViewCell.identifier)
        compositionCollectionView?.register(PostLikesCollectionViewCell.self, forCellWithReuseIdentifier: PostLikesCollectionViewCell.identifier)
        compositionCollectionView?.register(PostCaptionCollectionViewCell.self, forCellWithReuseIdentifier: PostCaptionCollectionViewCell.identifier)
        compositionCollectionView?.register(PostDatetimeCollectionViewCell.self, forCellWithReuseIdentifier: PostDatetimeCollectionViewCell.identifier)
        compositionCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}

extension HomeViewController: PosterCollectionViewCellDelegate {
    func PosterCollectionViewCellDidTapUsername(_ cell: PosterCollectionViewCell) {
        let destinationVC = ProfileViewController()
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func PosterCollectionViewCellDidTapMore(_ cell: PosterCollectionViewCell) {
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 15)!, NSAttributedString.Key.foregroundColor: UIColor.black]
        let titleString = NSAttributedString(string: "Post Actions", attributes: titleAttributes)

        let alertVC = UIAlertController(title: "Post Actions", message: nil, preferredStyle: .actionSheet)
        alertVC.setValue(titleString, forKey: "attributedTitle")
        
        alertVC.addAction(UIAlertAction(title: "Share Post", style: .default, handler: { _ in
            
        }))
        
        alertVC.addAction(UIAlertAction(title: "Report Post", style: .destructive, handler: { _ in
            
        }))
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        cancelAction.setValue(UIColor.systemRed, forKey: "titleTextColor")
        alertVC.addAction(cancelAction)
        present(alertVC, animated: true)
    }
}

extension HomeViewController: PostCollectionViewCellDelegate {
    func didDuobleTappedOnPostPhoto(_ cell: PostCollectionViewCell) {
        print("Double tapp for like")
    }
}

extension HomeViewController: PostActionCollectionViewCellDelegate {
    func PostActionCollectionViewCellDidTapLike(_ cell: PostActionCollectionViewCell, isLiked: Bool) {
        
    }
    
    func PostActionCollectionViewCellDidTapComment(_ cell: PostActionCollectionViewCell) {
        let destinationVC = PostViewController()
        destinationVC.title = "Post"
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func PostActionCollectionViewCellDidTapShare(_ cell: PostActionCollectionViewCell) {
        let shareVC = UIActivityViewController(activityItems: ["Share", URL(string: "https://www.apple.com")!], applicationActivities: [])
        present(shareVC, animated: true)
    }
}

extension HomeViewController: PostLikesCollectionViewCellDelegate {
    func PostLikesCollectionViewCellDidTapLikeCount(_ cell: PostLikesCollectionViewCell) {
        let destinationVC = ListViewController()
        destinationVC.title = "Liked By"
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

extension HomeViewController: PostCaptionCollectionViewCellDelegate {
    func PostCaptionCollectionViewCellDidTapCaption(_ cell: PostCaptionCollectionViewCell) {
        print("Tapped on Caption")
    }
}
