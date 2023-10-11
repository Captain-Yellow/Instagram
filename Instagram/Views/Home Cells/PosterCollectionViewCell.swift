//
//  PosterCollectionViewCell.swift
//  Instagram
//
//  Created by Mohammad Afshar on 03/10/2023.
//

import UIKit
import SDWebImage

protocol PosterCollectionViewCellDelegate: AnyObject {
    /// Dont Forget: Create a optional weak delegate property - Pass self as argument of protocol methods
    func PosterCollectionViewCellDidTapUsername(_ cell: PosterCollectionViewCell)
    func PosterCollectionViewCellDidTapMore(_ cell: PosterCollectionViewCell)
}

class PosterCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "PosterCollectionViewCell"
    
    weak var delegate: PosterCollectionViewCellDelegate?

    private let profilePhoto: UIImageView = {
        let photo = UIImageView()
        photo.layer.cornerRadius = 24
        photo.layer.masksToBounds = true
        photo.contentMode = .scaleAspectFill
        return photo
    }()
    
    private let profileName: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 18, weight: .regular)
        return nameLabel
    }()
    
    private lazy var moreButton: UIButton = {
        let custom = UIButton()
        custom.tintColor = .label
        let image = UIImage(systemName: "ellipsis", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        custom.setImage(image, for: .normal)
        custom.addTarget(self, action: #selector(didTappedMore), for: .touchUpInside)
        return custom
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.backgroundColor = .systemBackground
        
        contentView.addSubview(profilePhoto)
        contentView.addSubview(profileName)
        contentView.addSubview(moreButton)
        
        let usernameTap = UITapGestureRecognizer(target: self, action: #selector(didTappedUsername))
        usernameTap.numberOfTapsRequired = 1
        profileName.isUserInteractionEnabled = true
        profileName.addGestureRecognizer(usernameTap)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imagePadding: CGFloat = 4
        let imageSize: CGFloat = contentView.height - (imagePadding * 2)
        profilePhoto.frame = CGRect(x: imagePadding, y: imagePadding, width: imageSize, height: imageSize)
        
        profileName.sizeToFit()
        profileName.frame = CGRect(x: profilePhoto.right + 10, y: 0, width: profileName.width, height: contentView.height)
        
        moreButton.frame = CGRect(x: contentView.width - 60, y: (contentView.height - 50)/2, width: 50, height: 50)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profilePhoto.image = nil
        profileName.text = nil
    }
    
    internal func configure(with viewModel: PosterCollectionViewCellViewModel) {
        profilePhoto.sd_setImage(with: viewModel.profilePictureUrl, completed: nil)
        profileName.text = viewModel.username
    }
    
    @objc func didTappedMore() {
        print("\n\n More Button, Home View->Poster View Cell \n\n")
        delegate?.PosterCollectionViewCellDidTapMore(self)
    }
    
    @objc func didTappedUsername() {
        print("\n\n Username Tapped \n\n")
        delegate?.PosterCollectionViewCellDidTapUsername(self)
    }
}
