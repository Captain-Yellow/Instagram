//
//  PostLikesCollectionViewCell.swift
//  Instagram
//
//  Created by Mohammad Afshar on 03/10/2023.
//

import UIKit

protocol PostLikesCollectionViewCellDelegate: AnyObject {
    /// Dont Forget: Create a optional weak delegate property - Pass self as argument of protocol methods
    func PostLikesCollectionViewCellDidTapLikeCount(_ cell: PostLikesCollectionViewCell)
}

class PostLikesCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "PostLikesCollectionViewCell"
    weak var delegate: PostLikesCollectionViewCellDelegate?
    
    private let likeCount: UILabel = {
        let custom = UILabel()
        custom.numberOfLines = 1
        custom.font = .systemFont(ofSize: 14, weight: .bold)
        return custom
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.backgroundColor =  .systemBackground
        
        contentView.addSubview(likeCount)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapLikeCount))
        likeCount.isUserInteractionEnabled = true
        likeCount.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        likeCount.frame = CGRect(x: 15, y: 0, width: contentView.width, height: contentView.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        likeCount.text = nil
    }
    
    func configure(with viewModel: PostLikesCollectionViewCellViewModel) {
        likeCount.text = "\(viewModel.likers.count) Likes"
    }
    
    @objc func didTapLikeCount() {
        delegate?.PostLikesCollectionViewCellDidTapLikeCount(self)
    }
}
