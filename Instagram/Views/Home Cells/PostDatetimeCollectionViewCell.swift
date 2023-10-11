//
//  PostDatetimeCollectionViewCell.swift
//  Instagram
//
//  Created by Mohammad Afshar on 03/10/2023.
//

import UIKit

class PostDatetimeCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "PostDatetimeCollectionViewCell"
    
    private let dateLabel: UILabel = {
        let custom = UILabel()
        custom.textColor = .systemGray
        custom.font = .systemFont(ofSize: 15)
        return custom
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.backgroundColor =  .systemBackground
        contentView.addSubview(dateLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dateLabel.frame = CGRect(x: 15, y: 0, width: contentView.width-15, height: contentView.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with viewModel: PostDatetimeCollectionViewCellViewModel) {
        dateLabel.text = .date(from: viewModel.date)
    }
}
