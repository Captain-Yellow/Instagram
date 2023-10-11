//
//  PostCollectionViewCell.swift
//  Instagram
//
//  Created by Mohammad Afshar on 03/10/2023.
//

import UIKit

protocol PostCollectionViewCellDelegate: AnyObject {
    /// Dont Forget: Create a optional weak delegate property - Pass self as argument of protocol methods
    func didDuobleTappedOnPostPhoto(_ cell: PostCollectionViewCell)
}

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "PostCollectionViewCell"
    
    weak var delegate: PostCollectionViewCellDelegate?
    
    private let postedPhoto: UIImageView = {
        let custom = UIImageView()
        custom.contentMode = .scaleAspectFill
        custom.layer.masksToBounds = true
        return custom
    }()

    private let hiddenHeart: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "suit.heart.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 50))
        imageView.image = image
        imageView.isHidden = true
        imageView.alpha = 0
        imageView.tintColor = .red
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.backgroundColor =  .secondarySystemBackground
        
        contentView.addSubview(postedPhoto)
        contentView.addSubview(hiddenHeart)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didDoubleTappedOnPhoto))
        tapGesture.numberOfTapsRequired = 2
        postedPhoto.isUserInteractionEnabled = true
        postedPhoto.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        postedPhoto.frame = contentView.bounds
        let hiddenHertSize: CGFloat = 150
        hiddenHeart.frame = CGRect(x: (contentView.width-(hiddenHertSize+50))/2, y: (contentView.height-hiddenHertSize)/2, width: hiddenHertSize+50, height: hiddenHertSize)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postedPhoto.image = nil
    }
    
    func configure(with viewModel: PostCollectionViewCellViewModel) {
        postedPhoto.sd_setImage(with: viewModel.postUrl, completed: nil)
    }
    
    // MARK: - Actions
    @objc func didDoubleTappedOnPhoto() {
        delegate?.didDuobleTappedOnPostPhoto(self)
        self.hiddenHeart.isHidden = false
        UIView.animate(withDuration: 0.4) {
            self.hiddenHeart.alpha = 0.5
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.4) {
                    self.hiddenHeart.alpha = 0
                } completion: { done in
                    if done {
                        self.hiddenHeart.isHidden = true
                    }
                }
            }
        }
    }
}
