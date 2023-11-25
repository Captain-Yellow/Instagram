//
//  PhotoCollectionViewCell.swift
//  Instagram
//
//  Created by Mohammad Afshar on 25/11/2023.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identity = "PhotoCollectionViewCell"
    
    private let photo: UIImageView = {
        let custom = UIImageView()
        custom.clipsToBounds = true
        custom.tintColor = .gray
        return custom
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photo)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        photo.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        photo.image = nil
    }
    
    func configure(with image: UIImage?) {
        photo.image = image
    }
}
