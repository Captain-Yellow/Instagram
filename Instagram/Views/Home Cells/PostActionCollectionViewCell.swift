//
//  PostActionCollectionViewCell.swift
//  Instagram
//
//  Created by Mohammad Afshar on 03/10/2023.
//

import UIKit

protocol PostActionCollectionViewCellDelegate: AnyObject {
    /// Dont Forget: Create a optional weak delegate property - Pass self as argument of protocol methods
    func PostActionCollectionViewCellDidTapLike(_ cell: PostActionCollectionViewCell, isLiked: Bool)
    func PostActionCollectionViewCellDidTapComment(_ cell: PostActionCollectionViewCell)
    func PostActionCollectionViewCellDidTapShare(_ cell: PostActionCollectionViewCell)
}

class PostActionCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "PostActionCollectionViewCell"
    private var likeState: Bool = false
    weak var delegate: PostActionCollectionViewCellDelegate?
    
    private let likeButton: UIButton = {
        let custom = UIButton()
        custom.tintColor = .label
        let image = UIImage(systemName: "suit.heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        custom.setImage(image, for: .normal)
        return custom
    }()
    
    private let commentButton: UIButton = {
        let custom = UIButton()
        custom.tintColor = .label
        let image = UIImage(systemName: "message", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))
        custom.setImage(image, for: .normal)
        return custom
    }()
    
    private let shareButton: UIButton = {
        let custom = UIButton()
        custom.tintColor = .label
        let image = UIImage(systemName: "paperplane", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))
        custom.setImage(image, for: .normal)
        return custom
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.backgroundColor =  .systemBackground
        
        contentView.addSubview(likeButton)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        contentView.addSubview(commentButton)
        commentButton.addTarget(self, action: #selector(didTapComment), for: .touchUpInside)
        contentView.addSubview(shareButton)
        shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let BTSize: CGFloat = 35
        likeButton.frame = CGRect(x: 10, y: (contentView.height - BTSize)/2, width: BTSize, height: BTSize)
        commentButton.frame = CGRect(x: likeButton.right+10, y: (contentView.height - BTSize)/2, width: BTSize, height: BTSize)
        shareButton.frame = CGRect(x: commentButton.right+10, y: (contentView.height - BTSize)/2, width: BTSize, height: BTSize)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        likeState = false
    }
    
    func configure(with viewModel: PostActionsCollectionViewCellViewModel) {
        if viewModel.isLiked {
            likeButton.setImage(UIImage(systemName: "suit.heart.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
            likeButton.tintColor = .systemRed
            likeState = !likeState
        } else {
            likeButton.setImage(UIImage(systemName: "suit.heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
            likeButton.tintColor = .label
            likeState = !likeState
        }
    }
    
    @objc func didTapLike() {
//        delegate?.PostActionCollectionViewCellDidTapLike(self, isLiked: <#T##Bool#>)
        DispatchQueue.main.async { [self] in
            if likeState {
                likeButton.setImage(UIImage(systemName: "suit.heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
                likeButton.tintColor = .label
                likeState = !likeState
            } else {
                likeButton.setImage(UIImage(systemName: "suit.heart.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
                likeButton.tintColor = .systemRed
                likeState = !likeState
            }
        }
    }
    
    @objc func didTapComment() {
        delegate?.PostActionCollectionViewCellDidTapComment(self)
    }
    
    @objc func didTapShare() {
        delegate?.PostActionCollectionViewCellDidTapShare(self)
    }
}
